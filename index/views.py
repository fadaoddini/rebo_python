import datetime
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from django.contrib.auth import get_user_model as user_model
from django.contrib import messages
from django.views import View

from blog.models import Blog
from catalogue.models import Product
from company.forms import CompanyForm
from company.models import Company
from info.forms import InfoUserForm
from django.views.decorators.http import require_http_methods
from info.models import Info
from info import forms
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy

from config.lib_custom.utils import CustomPagination
from transaction.models import Transaction
from transaction.views import add_balance_user


class MainAdmin(View):
    template_name = 'index/sharjewallet.html'

    def get(self, request, *args, **kwargs):
        context = dict()
        context['products'] = Product.objects.filter(is_active=False).filter(expire_time__gt=datetime.datetime.now())
        context['info'] = Info.objects.filter(user=request.user).first()
        context['company'] = Company.objects.filter(user=request.user).first()
        form_info = InfoUserForm()
        context['form_info'] = form_info
        form_company = CompanyForm()
        context['form_company'] = form_company
        return render(request, template_name=self.template_name, context=context,
                      content_type=None, status=None, using=None)


class MainIndex(View):
    template_name = 'web/index.html'

    def get(self, request, *args, **kwargs):
        context = dict()
        context['blogs'] = Blog.objects.filter(status=True).all()
        if request.user.is_anonymous:
            products = Product.objects.filter(is_active=True).filter(
                expire_time__gt=datetime.datetime.now()).order_by('price')
            context['products'] = products
            CustomPagination.create_paginator(products, 8, 3, context, request)

        else:
            products = Product.objects.filter(is_active=True).filter(
                expire_time__gt=datetime.datetime.now()).order_by('price')
            context['products'] = products
            context['info'] = Info.objects.filter(user=request.user).first()
            context['company'] = Company.objects.filter(user=request.user).first()
            form_info = InfoUserForm()
            context['form_info'] = form_info
            form_company = CompanyForm()
            context['form_company'] = form_company
            CustomPagination.create_paginator(products, 8, 3, context, request)

        return render(request, template_name=self.template_name, context=context,
                      content_type=None, status=None, using=None)


class MainIndexSearch(View):
    template_name = 'web/search/index.html'

    def get(self, request, *args, **kwargs):
        context = dict()
        sbazar = request.GET.get('bazar')
        stype = request.GET.get('type')
        sprice = request.GET.get('price')
        if sbazar == "None":
            sbazar = None
            tbazar = False
        else:
            tbazar = True

        if stype == "None":
            stype = None
            ttype = False
        else:
            ttype = True

        if sprice == "None":
            sprice = None
            tprice = False
        else:
            tprice = True

        if tbazar:
            if ttype:
                if tprice:
                    text = "همه پر هستند"
                    allproducts = Product.objects.filter(is_active=True)\
                        .filter(expire_time__gt=datetime.datetime.now())\
                        .filter(sell_buy=sbazar)\
                        .filter(product_type=stype)
                else:
                    text = "فقط مبلغ خالیه"
                    allproducts = Product.objects.filter(is_active=True) \
                        .filter(expire_time__gt=datetime.datetime.now()) \
                        .filter(sell_buy=sbazar) \
                        .filter(product_type=stype)
            else:
                if tprice:
                    text = "نوع خالی است "
                    allproducts = Product.objects.filter(is_active=True) \
                        .filter(expire_time__gt=datetime.datetime.now()) \
                        .filter(sell_buy=sbazar)
                else:
                    text = "نوع و قیمت خالی است "
                    allproducts = Product.objects.filter(is_active=True) \
                        .filter(expire_time__gt=datetime.datetime.now()) \
                        .filter(sell_buy=sbazar)
        else:
            if ttype:
                if tprice:
                    text = "بازار خالی است "
                    allproducts = Product.objects.filter(is_active=True) \
                        .filter(expire_time__gt=datetime.datetime.now()) \
                        .filter(product_type=stype)
                else:
                    text = "بازار و قیمت خالی هستند "
                    allproducts = Product.objects.filter(is_active=True) \
                        .filter(expire_time__gt=datetime.datetime.now()) \
                        .filter(product_type=stype)
            else:
                if tprice:
                    text = "بازار و نوع خالی است "
                    allproducts = Product.objects.filter(is_active=True) \
                        .filter(expire_time__gt=datetime.datetime.now())
                else:
                    text = "بازار و نوع و مبلغ خالی است "
                    allproducts = Product.objects.filter(is_active=True) \
                        .filter(expire_time__gt=datetime.datetime.now())

        if request.user.is_anonymous:

            if sprice == "low":
                context['products'] = allproducts.order_by('price')
            if sprice == "top":
                context['products'] = allproducts.order_by('-price')
            else:
                context['products'] = allproducts
        else:
            if sprice == "low":
                context['products'] = allproducts.order_by('price')
            if sprice == "top":
                context['products'] = allproducts.order_by('-price')
            else:
                context['products'] = allproducts

            products = context['products']
            context['info'] = Info.objects.filter(user=request.user).first()
            context['company'] = Company.objects.filter(user=request.user).first()
            form_info = InfoUserForm()
            context['form_info'] = form_info
            form_company = CompanyForm()
            context['form_company'] = form_company
            CustomPagination.create_paginator(products, 8, 3, context, request)

        return render(request, template_name=self.template_name, context=context,
                      content_type=None, status=None, using=None)


class Profile(View):
    template_name = 'web/profile/info/index.html'

    def get(self, request, *args, **kwargs):
        context = dict()
        user_info = request.user
        context['user_info'] = user_info
        information = Info.objects.filter(user=request.user).first()
        if information:
            context['info'] = information
            if information.image == "":
                context['image'] = "https://rebo.ir/static/web/assets/img/profile/profile2.jpg"
            else:
                context['image'] = information.image.url

            if information.image_codemeli == "":
                context['image_codemeli'] = "https://rebo.ir/static/web/assets/images/cardmeli.jpg"
                context['okmeli'] = False
            else:
                context['image_codemeli'] = information.image_codemeli.url
                context['okmeli'] = information.okmeli
            if information.image_shaba == "":
                context['image_shaba'] = "https://rebo.ir/static/web/assets/images/cardbanki.jpg"
                context['okbank'] = False
            else:
                context['image_shaba'] = information.image_shaba.url
                context['okbank'] = information.okbank
        else:
            context['image'] = "https://rebo.ir/static/web/assets/img/profile/profile2.jpg"
            context['image_codemeli'] = "https://rebo.ir/static/web/assets/images/cardmeli.jpg"
            context['image_shaba'] = "https://rebo.ir/static/web/assets/images/cardbanki.jpg"

        return render(request, template_name=self.template_name, context=context,
                      content_type=None, status=None, using=None)


@login_required
@require_http_methods(request_method_list=['POST'])
def update_info(request):
    mobile = request.user.mobile
    User = user_model()
    user = User.objects.filter(mobile=mobile).first()
    transaction = Transaction(user=user, transaction_type=1, amount=0)
    transaction.save()
    add_balance_user(request, user.pk)

    checkoneuser = request.user
    infoexist = Info.objects.filter(user_id=checkoneuser.pk).first()
    if infoexist:
        form = forms.InfoUserForm(request.POST, request.FILES, instance=infoexist)
    else:
        form = forms.InfoUserForm(request.POST, request.FILES)

    if form.is_valid():
        information = form.save(commit=False)
        if infoexist:
            print("info-valid-form")
            information.save()
        else:
            print("else-form")
            information.user = request.user
            information.is_active = False
            information.save()
        messages.info(request, "اطلاعات با موفقیت ارسال شد، بعد از تایید اطلاعات می توانید از این سامانه استفاده کنید")
        return HttpResponseRedirect(reverse_lazy('profile'))
    else:

        if not testmeli(request.POST.get('codemeli'))[1]:
            messages.error(request, testmeli(request.POST.get('codemeli'))[0])
            return HttpResponseRedirect(reverse_lazy('profile'))

        if request.POST.get('shaba') is not None:
            if not testshaba(request.POST.get('shaba'))[1]:
                messages.error(request, testshaba(request.POST.get('shaba'))[0])
                return HttpResponseRedirect(reverse_lazy('profile'))
    messages.error(request, "اطلاعات ارسال شده توسط شما مطابق انتظار ما نبود! لطفا مجددا تلاش نمائید")
    return HttpResponseRedirect(reverse_lazy('profile'))


def testshaba(shaba):
    res = True
    message_error = "در حال بررسی شبای بانکی ..."
    if shaba == "None":
        message_error = None
        res = False
        return message_error, res
    if len(shaba) != 24:
        message_error = "شماره شبا وارد شده معتبر نیست"
        res = False
        return message_error, res
    existshaba = Info.objects.filter(shaba=shaba).first()
    if existshaba:
        message_error = "شماره شبا وارد شده قبلا ثبت شده است"
        res = False
    return message_error, res


def testmeli(codemeli):
    res_meli = True
    message_error_meli = "در حال بررسی کد ملی ..."
    if len(codemeli) != 10:
        message_error_meli = "کد ملی وارد شده معتبر نیست"
        res_meli = False
        return message_error_meli, res_meli
    existmelli = Info.objects.filter(codemeli=codemeli).first()
    if existmelli:
        message_error_meli = "کد ملی وارد شده قبلا ثبت شده است"
        res_meli = False
    return message_error_meli, res_meli


@login_required
@require_http_methods(request_method_list=['POST'])
def update_info_image(request):
    checkoneuser = request.user
    infoexist = Info.objects.filter(user_id=checkoneuser.pk).first()
    if infoexist:

        form = forms.InfoImageForm(request.POST, request.FILES, instance=infoexist)
    else:

        form = forms.InfoImageForm(request.POST, request.FILES)
    if form.is_valid():
        information = form.save(commit=False)
        information.image = request.FILES.get('image_info')
        information.save()
    return HttpResponseRedirect(reverse_lazy('profile'))

