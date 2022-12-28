from django.contrib.auth import login
from django.db.models import Q
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.http import require_POST

from catalogue.models import Product
from login import forms, helper
from login.models import MyUser
from django.contrib import messages


def verify_otp(request):
    try:
        context = dict()
        mobile = request.session.get('user_mobile')
        user = MyUser.objects.get(mobile=mobile)
        if request.method == "POST":
            # check otp expiration
            if not helper.check_otp_expiration(mobile):
                messages.error(request, "کد شما اعتبار زمانی خود را از دست داده است لطفا مجددا سعی نمائید!")
                return HttpResponseRedirect(reverse_lazy('login-mobile'))
            if user.otp != int(request.POST.get('otp')):
                messages.error(request, "در وارد کردن کد ارسال شده بیشتر دقت کنید گویا اشتباه وارد می کنید!")
                return HttpResponseRedirect(reverse_lazy('login-mobile'))
            user.is_active = True
            user.save()
            login(request, user)
            return HttpResponseRedirect(reverse_lazy('index'))
        context['mobile'] = mobile
        return render(request, 'login/verify.html', context=context)
    except MyUser.DoesNotExist:
        return HttpResponseRedirect(reverse_lazy('login-mobile'))


def register_user(request):
    if request.user.is_authenticated:
        messages.info(request, "کاربر گرامی خوش آمدید!")
        return HttpResponseRedirect(reverse_lazy('index'))
    form = forms.RegisterUser

    if request.method == "POST":
        try:
            if "mobile" in request.POST:
                mobile = request.POST.get('mobile')
                user = MyUser.objects.get(mobile=mobile)
                # check otp exists
                if helper.check_otp_expiration(mobile):
                    messages.error(request, "شما به تازگی پیامکی دریافت نموده اید و هنوز کد شما معتبر است!")
                    return HttpResponseRedirect(reverse_lazy('verify-otp'))
                # send otp
                otp = helper.create_random_otp()
                helper.send_otp(mobile, otp)
                # save otp
                user.otp = otp
                user.save()
                request.session['user_mobile'] = user.mobile
                # redirect to verify code
                return HttpResponseRedirect(reverse_lazy('verify-otp'))
        except MyUser.DoesNotExist:
            form = forms.RegisterUser(request.POST)
            if form.is_valid():
                user = form.save(commit=False)
                # send otp
                otp = helper.create_random_otp()
                helper.send_otp(mobile, otp)
                # save otp
                user.otp = otp
                user.is_active = False
                user.save()
                request.session['user_mobile'] = user.mobile
                return HttpResponseRedirect(reverse_lazy('verify-otp'))
    return render(request, 'login/login.html', {'form': form})