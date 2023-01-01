import jdatetime
import datetime
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.http import require_http_methods

from company.models import Company, Location, Staff
from hoghoogh import forms
from hoghoogh.forms import SettingHoghooghForm, ListPriceForm, ListAmarForm
from hoghoogh.models import SettingHoghoogh, ListPrice, Amar


def hoghoogh_list(request):
    return HttpResponse("hoghoogh list")


@login_required
def setting_hoghoogh(request):
    context = dict()
    company = Company.objects.filter(user=request.user).first()
    context['locations'] = Location.objects.filter(company=company)
    return render(request, 'hoghoogh/setting.html', context=context)


@login_required
def update_setting_hoghoogh(request, pk):
    context = dict()
    location = Location.objects.filter(pk=pk).first()
    setting_hoghoogh1 = SettingHoghoogh.objects.filter(location=location)
    context['setting_hoghoogh1'] = "NO"
    form_setting_hoghoogh = SettingHoghooghForm()
    if setting_hoghoogh1:
        setting_hoghoogh1 = setting_hoghoogh1.first()
        context['setting_hoghoogh1'] = setting_hoghoogh1
        form_setting_hoghoogh = SettingHoghooghForm(instance=setting_hoghoogh1)

    context['location'] = location
    context['pk'] = pk

    context['form_setting_hoghoogh'] = form_setting_hoghoogh
    return render(request, 'hoghoogh/update_setting.html', context=context)


@login_required
@require_http_methods(request_method_list=['POST'])
def update_setting_hoghoogh_send(request, pk):
    location = Location.objects.filter(pk=pk).first()
    form = forms.SettingHoghooghForm(request.POST)
    if form.is_valid():
        setting_hoghooghi = form.save(commit=False)
        setting_hoghooghi.location = location
        setting_hoghooghi.save()
        messages.info(request, "اطلاعات با موفقیت ثبت شد")
        return HttpResponseRedirect(reverse_lazy('setting-hoghoogh'))

    messages.error(request, "اطلاعات ارسال شده توسط شما مطابق انتظار ما نبود! لطفا مجددا تلاش نمائید")
    return HttpResponseRedirect(reverse_lazy('index'))


@login_required
@require_http_methods(request_method_list=['POST'])
def update_setting_hoghoogh_edit(request, pk):
    location = Location.objects.filter(pk=pk).first()
    setting_hoghoogh1 = SettingHoghoogh.objects.filter(location=location).first()
    form = forms.SettingHoghooghForm(request.POST, instance=setting_hoghoogh1)
    if form.is_valid():
        form.save()
        messages.info(request, "اطلاعات با موفقیت ویرایش شد")
        return HttpResponseRedirect(reverse_lazy('setting-hoghoogh'))

    messages.error(request, "اطلاعات ارسال شده توسط شما مطابق انتظار ما نبود! لطفا مجددا تلاش نمائید")
    return HttpResponseRedirect(reverse_lazy('index'))


@login_required
def listprice(request, pk):
    context = dict()
    location = Location.objects.filter(pk=pk).first()
    context['pk'] = pk
    context['location'] = location
    context['listprices'] = ListPrice.objects.filter(location=location)
    form_listprice = ListPriceForm()
    context['form_listprice'] = form_listprice
    return render(request, 'hoghoogh/listprice.html', context=context)


@login_required
def add_listprice(request, pk):

    location = Location.objects.filter(pk=pk).first()
    form = forms.ListPriceForm(request.POST)
    if form.is_valid():
        listprice1 = form.save(commit=False)
        listprice1.location = location
        listprice1.is_active = True
        listprice1.save()
        messages.info(request, "اطلاعات با موفقیت ثبت شد")
        return HttpResponseRedirect(reverse_lazy('listprice', kwargs={'pk': pk}))

    messages.error(request, "اطلاعات ارسال شده توسط شما مطابق انتظار ما نبود! لطفا مجددا تلاش نمائید")
    return HttpResponseRedirect(reverse_lazy('listprice', kwargs={'pk': pk}))


@login_required
def amar(request, pk):
    context = dict()
    list_price = ListPrice.objects.filter(is_active=True)

    context['list_price'] = list_price
    context['num_list_price'] = len(list_price)
    staff_choose = Staff.objects.filter(pk=pk).first()
    context['staff_choose'] = staff_choose
    context['location'] = staff_choose.location
    settinghoghoogh = SettingHoghoogh.objects.filter(location=staff_choose.location).first()
    num_day = settinghoghoogh.num_day
    tarikh = settinghoghoogh.start_end_hoghoogh.split('/')
    year = int(tarikh[0])
    context['year'] = year
    month = int(tarikh[1])
    context['month'] = month
    day = int(tarikh[2])
    context['day'] = day
    finish_tarikh = 32
    if num_day + day > finish_tarikh:
        range_days = range(day, finish_tarikh)
    else:
        range_days = range(day, num_day + day)
    context['time_range'] = range_days
    # CREATE TIME FOR CALCULATE NUM DAY LATER ----->>> shamsi to miladi
    # tarikh_choose_en = jdatetime.date(year=year, month=month, day=day).togregorian()
    # new_tarikh_split = str(tarikh_choose_en).split('-')
    # new_year = int(new_tarikh_split[0])
    # new_month = int(new_tarikh_split[1])
    # new_day = int(new_tarikh_split[2])
    # new_tarikh_shamsi = jdatetime.date.fromgregorian(year=new_year, month=new_month, day=new_day)
    context['settinghoghoogh'] = settinghoghoogh
    amarexist = Amar.objects.filter(staff_id=pk).select_related('listprice').all().order_by('tarikh')

    # amarexist = Amar.objects.filter(staff_id=pk)

    if amarexist:

        context['amarexist'] = amarexist
        form_amar = ListAmarForm()
        context['form_amar'] = form_amar

        return render(request, 'hoghoogh/amar_edit.html', context=context)
    else:

        form_amar = ListAmarForm()
        context['form_amar'] = form_amar
        return render(request, 'hoghoogh/amar.html', context=context)


@login_required
def edit_amar(request, pk):
    staff = Staff.objects.filter(pk=pk).first()
    location = staff.location
    list_amar = request.POST
    for item in list_amar:
        if not item == "csrfmiddlewaretoken":
            editamar = Amar.objects.filter(pk=item)
            if editamar:
                editamar = editamar.first()
                newname = str(item)
                tedad_new = request.POST.get(newname)

                editamar.tedad = tedad_new
                editamar.save()

    messages.info(request, "اطلاعات با موفقیت ویرایش شد")
    return HttpResponseRedirect(reverse_lazy('staff-list', kwargs={'pk': location.pk}))


@login_required
def add_amar(request, pk):
    staff = Staff.objects.filter(pk=pk).first()
    location = staff.location
    list_prices = ListPrice.objects.filter(is_active=True)
    settinghoghoogh = SettingHoghoogh.objects.filter(location=staff.location).first()
    num_day = settinghoghoogh.num_day
    tarikh = settinghoghoogh.start_end_hoghoogh.split('/')
    year = int(tarikh[0])
    month = int(tarikh[1])
    day = int(tarikh[2])
    finish_tarikh = 32
    if num_day + day > finish_tarikh:
        range_days = range(day, finish_tarikh)
    else:
        range_days = range(day, num_day + day)
    day_active = range_days
    test = request.POST
    year = test['year']
    month = test['month']
    for list_price in list_prices:
        num_list = list_price.pk
        new_price = list_price.price
        newname = "name["+str(num_list)+"]"
        idlistprice = num_list

        for day in day_active:
            new_tedad = "tedad["+str(day)+"]["+str(num_list)+"]"
            if day < 10:
                tarikh = str(year)+"/"+str(month)+"/0"+str(day)
            else:
                tarikh = str(year) + "/" + str(month) + "/" + str(day)

            if test[new_tedad] != "0":
                name = test[newname]
                price = new_price
                tedad = test[new_tedad]
                tarikh = tarikh
                createform = Amar(name=name, price=price, tedad=tedad, tarikh=tarikh, staff_id=staff.pk, listprice_id=idlistprice)
                createform.save()
    messages.info(request, "اطلاعات با موفقیت ثبت شد")
    return HttpResponseRedirect(reverse_lazy('staff-list', kwargs={'pk': location.pk}))

