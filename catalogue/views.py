from django.contrib.auth.models import User
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render

from catalogue.models import Product, Category, ProductType, Brand
from company.models import Company
from info.models import Info


def add_product(request, user):
    user = User.objects.filter(pk=user)
    if user.exists():
        user = user.first()
        context = dict()
        context['user'] = user
        return render(request, 'catalogue/add_product.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


def add_request(request, user):
    user = User.objects.filter(pk=user)
    if user.exists():
        user = user.first()
        context = dict()
        context['user'] = user

        return render(request, 'catalogue/add_request.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


def my_product_list(request, user):
    user = User.objects.filter(pk=user)
    if user.exists():
        user = user.first()
        context = dict()
        context['user'] = user

        return render(request, 'catalogue/my_product_list.html', context=context)
    return HttpResponse("متاسفانه اطلاعاتی بابت درخواست شما وجود ندارد")


def my_request_list(request, user):
    user = User.objects.filter(pk=user)
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
