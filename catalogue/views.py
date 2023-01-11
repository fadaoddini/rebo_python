import uuid
import random

import simplejson
from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test, login_required
from django.db.models import Q
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import get_user_model as user_model
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView
from rest_framework.response import Response
from django.core import serializers
from catalogue import forms
from catalogue.forms import SellProductForm, ProductImageFormSet, \
    AjaxProductTypeForm, TestForm, ProductAttrFormSet
from catalogue.models import Product, Category, ProductType, Brand, ProductAttribute
from company.models import Company
from info.models import Info
from order.utils import check_is_active, check_is_ok
from django.http import JsonResponse
import json


@login_required
@user_passes_test(check_is_active)
def add_product(request, pk):
    if check_is_ok(request.user, pk):
        User = user_model()
        user = User.objects.filter(pk=pk)
        if user.exists():
            user = user.first()
            context = dict()
            context['user'] = user

            form_ajax_product_type = AjaxProductTypeForm()
            form_sell_product = SellProductForm()
            form_images_product = ProductImageFormSet()
            form_attr_product = ProductAttrFormSet()

            context['form_sell_product'] = form_sell_product
            context['form_images_product'] = form_images_product
            context['form_attr_product'] = form_attr_product

            context['form_ajax_product_type'] = form_ajax_product_type
            return render(request, 'catalogue/add_product.html', context=context)
    messages.error(request, "شما مرتکب تقلب شده اید، مراقب باشید امتیازات منفی ممکن است حساب کاربری شما را مسدود کند!")
    return HttpResponseRedirect(reverse_lazy('index'))


@csrf_exempt
def check_type_product_ajax(request):
    if request.is_ajax():
        pk = request.POST.get('pk')
        product_type_exist = ProductType.objects.filter(pk=pk)
        product_attributes = ProductAttribute.objects.filter(product_type=pk)
        p_pk = product_attributes.first()
        print("###########################################")
        print(product_attributes)
        print("###########################################")
        if product_attributes:
            form_attr_product = TestForm(product_type=product_type_exist)
            # data = serializers.serialize('json', form_attr_product)
            print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
            formtest = list(product_attributes.values())
            print(formtest)
            print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
            return JsonResponse({'msg': formtest})
        else:
            return JsonResponse({'msg': 'error'})


@login_required
@user_passes_test(check_is_active)
def form_add_product(request):

    form1 = forms.SellProductForm(request.POST)
    print("formformformformformformformformformformformform")
    print(form1)
    print("formformformformformformformformformformformform")
    if form1.is_valid():
        product = form1.save(commit=False)
        product.user = request.user
        product.sell_buy = 1
        product.upc = random.randint(1111111111, 9999999999)
        product.is_active = False
        product.save()
        return HttpResponseRedirect(reverse_lazy('product-list'))
    messages.error(request, "اطلاعات درست به سرور نرسید گویا اشتباهی در ارسال داده رخ داده است")
    return HttpResponseRedirect(reverse_lazy('index'))


@login_required
@user_passes_test(check_is_active)
def add_request(request, pk):
    User = user_model()
    user = User.objects.filter(pk=pk)
    if user.exists():
        user = user.first()
        context = dict()
        context['user'] = user

        return render(request, 'catalogue/add_request.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


@login_required
@user_passes_test(check_is_active)
def my_product_list(request, pk):
    User = user_model()
    user = User.objects.filter(pk=pk)
    if user.exists():
        user = user.first()
        context = dict()
        context['user'] = user

        return render(request, 'catalogue/my_product_list.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


@login_required
@user_passes_test(check_is_active)
def my_request_list(request, pk):
    if check_is_ok(request.user, pk):
        User = user_model()
        user = User.objects.filter(pk=pk)
        if user.exists():
            user = user.first()
            context = dict()
            context['user'] = user

            return render(request, 'catalogue/my_request_list.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


def product_list(request):

    products_filter = Product.objects.filter(is_active=True)
    products_exclude = Product.objects.exclude(is_active=False)

    category_first = Category.objects.first()
    category_last = Category.objects.last()
    category = Category.objects.get(id=4)
    brand = Brand.objects.first()

    products = Product.objects.filter(is_active=True, category_id=4)

    products = Product.objects.prefetch_related('category').all()
    products = Product.objects.select_related('category', 'brand').all()
    product_type = ProductType.objects.first()
    # product_create = Product.objects.create(
    #     product_type=product_type,
    #     upc=8456113,
    #     title="خرمای مضافتی تست",
    #     description="",
    #     category=category,
    #     brand=brand
    # )

    # context = "".join([f"{product.title} ===>>>> {product.upc}"
    #                   f"  |||| - {product.category.name} - |||| "
    #                   f"  |||| - {product.brand.name} - |||| \n"
    #                   for product in products])
    # return HttpResponse(context)
    context = dict()
    context['products'] = Product.objects.all()

    return render(request, 'catalogue/product_list.html', context=context)


def product_detail(request, pk):
    queryset = Product.objects.filter(Q(pk=pk) | Q(upc=pk))
    if queryset.exists():
        product = queryset.first()
        return HttpResponse(product.title)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


def category_products(request, pk):
    try:
        queryset = Category.objects.prefetch_related('products')
        if queryset:
            category = queryset.get(pk=pk)
            products = Product.objects.filter(category=category)
        else:
            return HttpResponse("متاسفانه چیزی پیدا نشد!")
    except Category.DoesNotExist:
        return HttpResponse("متاسفانه دسته بندی با این مشخصات ثبت نشده است")
    if products:
        context = "".join([f"{product.title} ===>>>> {product.upc}"
                           f"  |||| - {product.category.name} - |||| \n"
                           for product in products])
        return HttpResponse(context)
    else:
        return HttpResponse("متاسفانه چیزی پیدا نشد!")


def brand_products(request, pk):
    try:
        queryset = Brand.objects.prefetch_related('products')
        if queryset:
            brand = queryset.get(pk=pk)
            products = Product.objects.filter(brand=brand)
        else:
            return HttpResponse("متاسفانه چیزی پیدا نشد!")
    except Brand.DoesNotExist:
        return HttpResponse("متاسفانه برندی با این مشخصات ثبت نشده است")
    if products:
        context = "".join([f"{product.title} ===>>>> {product.upc}"
                           f"  |||| - {product.brand.name} - |||| \n"
                           for product in products])
        return HttpResponse(context)
    else:
        return HttpResponse("متاسفانه چیزی پیدا نشد!")
