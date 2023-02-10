import uuid
import random
import datetime
from datetime import datetime, timedelta
import simplejson
from django.contrib import messages
from django.contrib.auth.decorators import user_passes_test, login_required
from django.db.models import Q, Avg, Max, Min, Count
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render
from django.contrib.auth import get_user_model as user_model
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.generics import get_object_or_404
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.core import serializers
from catalogue import forms
from catalogue.forms import SellProductForm, ProductImageFormSet, \
    AjaxProductTypeForm, TestForm, ProductAttrFormSet
from catalogue.models import Product, Category, ProductType, Brand, ProductAttribute, ProductAttributeValue, \
    ProductImage, ProductAttr
from catalogue.serializers import ProductSellSerializer, ProductSingleSerializer
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
        show_item = True
        types = ProductType.objects.all()
        categories = Category.objects.all()
        brands = Brand.objects.all()
        if user.exists():
            user = user.first()
            context = dict()
            context['user'] = user
            context['types'] = types
            context['categories'] = categories
            context['brands'] = brands
            context['show_item'] = show_item
            return render(request, 'catalogue/add_product.html', context=context)
    messages.error(request, "شما مرتکب تقلب شده اید، مراقب باشید امتیازات منفی ممکن است حساب کاربری شما را مسدود کند!")
    return HttpResponseRedirect(reverse_lazy('index'))


@csrf_exempt
def create_chart_top(request):
    if request.is_ajax():
        day = request.POST.get('day')
        pk = request.POST.get('pk')
        amar = {}
        product_type_exist = ProductType.objects.all()
        last_month = datetime.today() - timedelta(days=int(day))
        bazars = Product.objects.filter(sell_buy=1).filter(product_type_id=pk).filter(create_time__gt=last_month)
        price_avg = bazars.aggregate(avg_price=Avg('price'))
        price_max = bazars.aggregate(max_price=Max('price'))
        price_min = bazars.aggregate(min_price=Min('price'))
        bazar_count = bazars.count()
        product_type = ProductType.objects.filter(pk=pk).first()
        if product_type_exist:
            amar['price_avg'] = price_avg['avg_price']
            amar['price_max'] = price_max['max_price']
            amar['price_min'] = price_min['min_price']
            amar['bazar_count'] = bazar_count
            amar['product_type_name'] = product_type.title
            result_amar = list(amar.values())
            result_chart2 = list(bazars.values())
            return JsonResponse({
                'msg': result_chart2,
                'result_amar': result_amar
            })
        else:
            return JsonResponse({'msg': 'error'})


@csrf_exempt
def check_type_product_ajax(request):
    if request.is_ajax():
        pk = request.POST.get('pk')
        product_type_exist = ProductType.objects.filter(pk=pk)
        product_attributes = ProductAttribute.objects.filter(product_type=pk)
        if product_attributes:
            form_test = list(product_attributes.values())
            return JsonResponse({'msg': form_test})
        else:
            return JsonResponse({'msg': 'error'})


@csrf_exempt
def check_attr_product_ajax(request):
    if request.is_ajax():
        pk = request.POST.get('pk')
        product_attribute_values = ProductAttributeValue.objects.filter(product_attribute=pk)
        if product_attribute_values:
            form_test = list(product_attribute_values.values())
            return JsonResponse({'msg': form_test})
        else:
            return JsonResponse({'msg': 'error'})


@login_required
@user_passes_test(check_is_active)
def form_add_product(request):
    sell_buy = 1
    next = request.POST.get('next', '/')
    # ADD PRODUCT TABLE
    result = Product.add_product(request, sell_buy)
    if result == "100":
        messages.info(request, "محصول شما با موفقیت در سامانه ثبت گردید، "
                               "بعد از تایید توسط کارشناسان قابل نمایش خواهد بود ")
        return HttpResponseRedirect(next)
    elif result == "10":
        messages.error(request, "لطفا عنوانی را برای محصول خود مشخص کنید")
        return HttpResponseRedirect(next)
    elif result == "20":
        messages.error(request, "لطفا قیمت واحد محصول خود را بصورت ریالی درج نمائید")
        return HttpResponseRedirect(next)
    elif result == "30":
        messages.error(request, "لطفا وزن تقریبی موجودی کالای خود را درج نمائید")
        return HttpResponseRedirect(next)
    elif result == "40":
        messages.error(request, "لطفا نوع محصول خود را مشخص نمائید")
        return HttpResponseRedirect(next)
    else:
        messages.error(request, "خطا در ورود اطلاعات محصول، لطفا در ورود اطلاعات دقت لازم را مبذول فرمائید")
        return HttpResponseRedirect(next)


@login_required
@user_passes_test(check_is_active)
def form_add_request(request):
    sell_buy = 2
    next = request.POST.get('next', '/')
    # ADD PRODUCT TABLE
    result = Product.add_product(request, sell_buy)
    if result == "100":
        messages.info(request, "درخواست شما با موفقیت در سامانه ثبت گردید، "
                               "بعد از تایید توسط کارشناسان قابل نمایش خواهد بود ")
        return HttpResponseRedirect(next)
    elif result == "10":
        messages.error(request, "لطفا عنوانی را برای درخواست خود مشخص کنید")
        return HttpResponseRedirect(next)
    elif result == "20":
        messages.error(request, "لطفا قیمت خرید خود را بصورت ریالی درج نمائید")
        return HttpResponseRedirect(next)
    elif result == "30":
        messages.error(request, "لطفا وزن تقریبی نیاز خود را درج نمائید")
        return HttpResponseRedirect(next)
    elif result == "40":
        messages.error(request, "لطفا نوع محصول مورد نظر خود را مشخص نمائید")
        return HttpResponseRedirect(next)
    else:
        messages.error(request, "خطا در ورود اطلاعات درخواست، لطفا در ورود اطلاعات دقت لازم را مبذول فرمائید")
        return HttpResponseRedirect(next)


@login_required
@user_passes_test(check_is_active)
def add_request(request, pk):
    if check_is_ok(request.user, pk):
        User = user_model()
        user = User.objects.filter(pk=pk)
        show_item = True
        types = ProductType.objects.all()
        categories = Category.objects.all()
        brands = Brand.objects.all()
        if user.exists():
            user = user.first()
            context = dict()
            context['user'] = user
            context['types'] = types
            context['categories'] = categories
            context['brands'] = brands
            context['show_item'] = show_item
            return render(request, 'catalogue/add_request.html', context=context)
        return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")
    messages.error(request, "شما مرتکب تقلب شده اید، مراقب باشید امتیازات منفی ممکن است حساب کاربری شما را مسدود کند!")
    return HttpResponseRedirect(reverse_lazy('index'))


@login_required
@user_passes_test(check_is_active)
def my_product_list(request, pk):
    if check_is_ok(request.user, pk):
        User = user_model()
        user = User.objects.filter(pk=pk)
        show_item = True
        if user.exists():
            user = user.first()
            products = user.products.filter(sell_buy=1)
            context = dict()
            context['user'] = user
            context['products'] = products
            context['show_item'] = show_item
            return render(request, 'catalogue/my_product_list.html', context=context)
        return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")
    messages.error(request, "شما مرتکب تقلب شده اید، مراقب باشید امتیازات منفی ممکن است حساب کاربری شما را مسدود کند!")
    return HttpResponseRedirect(reverse_lazy('index'))


@login_required
@user_passes_test(check_is_active)
def my_request_list(request, pk):
    if check_is_ok(request.user, pk):
        User = user_model()
        user = User.objects.filter(pk=pk)
        show_item = True
        if user.exists():
            user = user.first()
            products = user.products.filter(sell_buy=2)
            context = dict()
            context['user'] = user
            context['products'] = products
            context['show_item'] = show_item
            return render(request, 'catalogue/my_request_list.html', context=context)
        return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")
    messages.error(request, "شما مرتکب تقلب شده اید، مراقب باشید امتیازات منفی ممکن است حساب کاربری شما را مسدود کند!")
    return HttpResponseRedirect(reverse_lazy('index'))


@login_required
@user_passes_test(check_is_active)
def bazar_sell(request, pk):
    bazars = Product.objects.filter(sell_buy=1).filter(product_type_id=pk)
    price_avg = bazars.aggregate(avg_price=Avg('price'))
    price_max = bazars.aggregate(max_price=Max('price'))
    price_min = bazars.aggregate(min_price=Min('price'))
    bazar_count = bazars.count()
    product_type = ProductType.objects.filter(pk=pk).first()
    show_item = True
    if bazars:
        context = dict()
        context['bazars'] = bazars
        context['show_item'] = show_item
        context['product_type'] = product_type
        context['price_avg'] = price_avg['avg_price']
        context['price_max'] = price_max['max_price']
        context['price_min'] = price_min['min_price']
        context['bazar_count'] = bazar_count
        return render(request, 'catalogue/bazar_sell.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


@login_required
@user_passes_test(check_is_active)
def bazar_buy(request):
    bazars = Product.objects.filter(sell_buy=2)
    show_item = True
    if bazars:
        context = dict()
        context['bazars'] = bazars
        context['show_item'] = show_item
        return render(request, 'catalogue/bazar_buy.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")



def product_list(request):
    products_filter = Product.objects.filter(is_active=True)
    products_exclude = Product.objects.exclude(is_active=False)
    category_first = Category.objects.first()
    category_last = Category.objects.last()
    category = Category.objects.all()
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
    products = Product.objects.all()
    context['products'] = products
    context['category'] = category
    print(products)
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


class ProductApi(APIView):

    # permission_classes = (IsAuthenticated, )
    def post(self, request, *args, **kwargs):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        sortby = body['sortby']
        type = body['type']
        if type == "sell":
            if sortby == "newest":
                product = Product.objects.filter(sell_buy=1).order_by('-modified_time')
            elif sortby == "highestWeight":
                product = Product.objects.filter(sell_buy=1).order_by('-weight')
            elif sortby == "lowestWeight":
                product = Product.objects.filter(sell_buy=1).order_by('weight')
        elif type == "buy":
            if sortby == "newest":
                product = Product.objects.filter(sell_buy=2).order_by('-modified_time')
            elif sortby == "highestWeight":
                product = Product.objects.filter(sell_buy=2).order_by('-weight')
            elif sortby == "lowestWeight":
                product = Product.objects.filter(sell_buy=2).order_by('weight')
        else:
            if sortby == "newest":
                product = Product.objects.all().order_by('-modified_time')
            elif sortby == "highestWeight":
                product = Product.objects.all().order_by('-weight')
            elif sortby == "lowestWeight":
                product = Product.objects.all().order_by('weight')

        serializer = ProductSellSerializer(product, many=True)
        return Response(serializer.data, content_type='application/json; charset=UTF-8')


class ProductSingleApi(APIView):

    # permission_classes = (IsAuthenticated, )
    def post(self, request, *args, **kwargs):
        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        pk = body['id']
        product = Product.objects.filter(pk=pk).first()

        serializer = ProductSingleSerializer(product)
        return Response(serializer.data, content_type='application/json; charset=UTF-8')
