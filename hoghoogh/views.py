from collections import Counter

import jdatetime
import datetime
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.db.models import Sum, F
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.http import require_http_methods

from company.models import Company, Location, Staff
from hoghoogh import forms
from hoghoogh.forms import SettingHoghooghForm, ListPriceForm, ListAmarForm, HoghooghFormFirst
from hoghoogh.models import SettingHoghoogh, ListPrice, Amar, Hoghoogh, Sarparasti, Tolid


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

    hoghooghexist = Hoghoogh.objects.filter(staff_id=staff_choose.pk)
    if hoghooghexist:
        hoghooghexist = hoghooghexist.first()
        form_hoghoogh_first = HoghooghFormFirst(instance=hoghooghexist)
    else:
        form_hoghoogh_first = HoghooghFormFirst()
    context['form_hoghoogh_first'] = form_hoghoogh_first

    if amarexist:

        context['amarexist'] = amarexist
        form_amar = ListAmarForm()
        context['form_amar'] = form_amar

    else:

        form_amar = ListAmarForm()
        context['form_amar'] = form_amar

    return render(request, 'hoghoogh/amar.html', context=context)


@login_required
def edit_amar(request, pk):
    staff = Staff.objects.filter(pk=pk).first()

    with transaction.atomic():
        add_hoghogh_first(request, staff.pk)
        tedad_day_by_staff = calculate_day_by_staff(request, staff)
        year_month = get_year_month(request, staff)
        year = year_month[0]
        month = year_month[1]
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
        if staff.role == 3:
            update_sarparastha(request, tedad_day_by_staff, year, month, staff)
            sum_tolid(request, year, month, staff)
        else:
            update_sarparast_check_role(request, year, month, staff)
            sum_tolid(request, year, month, staff)
        messages.info(request, "اطلاعات با موفقیت ویرایش شد")

    return HttpResponseRedirect(reverse_lazy('staff-list', kwargs={'pk': location.pk}))


@login_required
def add_amar(request, pk):
    staff = Staff.objects.filter(pk=pk).first()
    if staff.role == 3:
        is_sarparast = True
    else:
        is_sarparast = False
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
    year_month =year+month

    with transaction.atomic():
        for list_price in list_prices:
            num_list = list_price.pk
            new_price = list_price.price
            vlu = list_price.value_type
            if vlu == 1:
                new_type = "dates"
            else:
                new_type = "etc"

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
                    type = new_type
                    tedad = test[new_tedad]
                    tarikh = tarikh
                    createform = Amar(name=name, price=price, tedad=tedad, type=type, tarikh=tarikh, staff_id=staff.pk,
                                      listprice_id=idlistprice, is_sarparast=is_sarparast)
                    createform.save()

        add_hoghogh_first(request, staff.pk)
        tedad_day_by_staff = calculate_day_by_staff(request, staff)

        if staff.role == 3:
            update_sarparastha(request, tedad_day_by_staff, year, month, staff)
            sum_tolid(request, year, month, staff)
        else:
            update_sarparast_check_role(request, year, month, staff)
            sum_tolid(request, year, month, staff)
        messages.info(request, "اطلاعات با موفقیت ثبت شد")
    return HttpResponseRedirect(reverse_lazy('staff-list', kwargs={'pk': location.pk}))


@login_required()
def delete_item_amar(request, pk):
    item_amar = Amar.objects.filter(pk=pk).first()
    staff_id = item_amar.staff_id
    item_amar.delete()
    messages.error(request, "اطلاعات با موفقیت حذف شد")
    return HttpResponseRedirect(reverse_lazy('amar', kwargs={'pk': staff_id}))


@login_required()
def delete_all_item_amar_by_staff(request, pk):
    item_amar = Amar.objects.filter(staff_id=pk)
    item_amar.delete()
    messages.error(request, "کلیه اطلاعات مربوطه با موفقیت حذف شد")
    return HttpResponseRedirect(reverse_lazy('amar', kwargs={'pk': pk}))


@login_required()
def calculate_day_by_staff(request, staff):
    day_ok = 0
    hoghooghexist = Hoghoogh.objects.filter(staff_id=staff.pk)
    if hoghooghexist:
        amar = Amar.objects.filter(staff_id=staff.pk).select_related('listprice').all().order_by('tarikh')
        result_day = []
        for res in amar:
            result_day.append(res.tarikh)
        day_ok = len(list(set(result_day)))
    else:
        messages.error(request, "محاسبه روز غیر ممکن است!")
        return HttpResponseRedirect(reverse_lazy('staff-list', kwargs={'pk': staff.location.pk}))

    return day_ok


@login_required()
def check_hoghoogh_table(request, staff):
    hoghooghexist = Hoghoogh.objects.filter(staff_id=staff.pk)
    if hoghooghexist:
        pass
    else:
        pass


@login_required()
def get_year_month(request, staff):
    year_month = []
    settinghoghoogh = SettingHoghoogh.objects.filter(location=staff.location).first()
    num_day = settinghoghoogh.num_day
    tarikh = settinghoghoogh.start_end_hoghoogh.split('/')
    year = str(tarikh[0])
    month = str(tarikh[1])
    year_month.append(year)
    year_month.append(month)
    return year_month


@login_required()
def checklist_staff_amar(request, pk):
    context = dict()
    staff = Staff.objects.filter(pk=pk).first()
    location = staff.location
    context['staff'] = staff
    context['location'] = location
    settinghoghoogh = SettingHoghoogh.objects.filter(location=staff.location).first()
    context['settinghoghoogh'] = settinghoghoogh
    hoghooghexist = Hoghoogh.objects.filter(staff_id=staff.pk)
    if hoghooghexist:
        hoghoogh = hoghooghexist.first()
        context['hoghoogh'] = hoghoogh
        amar = Amar.objects.filter(staff_id=pk).select_related('listprice').all().order_by('tarikh')

        sumamar = amar.aggregate(sum_calculate=Sum(F('price') * F('tedad')))

        context['sarparasti'] = 0
        context['day_sarparasti'] = 0
        context['one_sarparasti_price'] = 0
        context['amar'] = amar
        year = hoghoogh.year

        context['year'] = year
        month = hoghoogh.month
        context['month'] = month

        result_day = []
        for res in amar:
            result_day.append(res.tarikh)
        day_ok = len(list(set(result_day)))
        context['day_ok'] = day_ok

        fix_salary_staff = staff.fix_salary
        context['fix_salary_staff'] = fix_salary_staff
        mosaede = hoghoogh.mosaede
        tashvighi = hoghoogh.tashvighi
        vam = hoghoogh.vam
        context['mosaede'] = mosaede
        context['tashvighi'] = tashvighi
        context['vam'] = vam
        context['bime_day'] = settinghoghoogh.price_bime_in_day
        context['sumamar'] = sumamar['sum_calculate']+fix_salary_staff
        context['sumitemprice'] = sumamar['sum_calculate']
        pele_one_day = settinghoghoogh.pele_one_day
        pele_two_day = settinghoghoogh.pele_two_day
        pele_three_day = settinghoghoogh.pele_three_day
        pele_one_darsad = settinghoghoogh.pele_one_darsad
        pele_two_darsad = settinghoghoogh.pele_two_darsad
        pele_three_darsad = settinghoghoogh.pele_three_darsad
        if (day_ok <= pele_one_day):
            darsad_pele = 0
        elif (day_ok > pele_one_day and day_ok <= pele_two_day):
            darsad_pele = pele_one_darsad
        elif (day_ok > pele_two_day and day_ok <= pele_three_day):
            darsad_pele = pele_two_darsad
        elif (day_ok > pele_three_day):
            darsad_pele = pele_three_darsad
        context['darsad_pele'] = darsad_pele
        price_darsad_pele = int(sumamar['sum_calculate']*darsad_pele/100)
        context['price_darsad_pele'] = price_darsad_pele
        check_bime = staff.insurance
        check_bime_status = staff.insurance_status
        if check_bime:
            context['check_bime'] = "دارد"
            if check_bime_status:
                price_bime_sum = day_ok * settinghoghoogh.price_bime_in_day
                context['check_bime_status'] = "دارد"
            else:
                price_bime_sum = day_ok * 0
                context['check_bime_status'] = "ندارد"
                context['bime_day'] = 0
        else:
            price_bime_sum = day_ok * 0
            context['check_bime'] = "ندارد"
            context['bime_day'] = 0
        context['price_bime_sum'] = price_bime_sum
        a = sumamar['sum_calculate'] + fix_salary_staff
        b = price_bime_sum
        c = vam
        d = mosaede
        e = tashvighi
        sum_first = a - b - c - d + e
        context['sum_first'] = sum_first
        context['sum_pay'] = sum_first + price_darsad_pele

        role = staff.role
        if role == 1:
            print('edari')
            context['role'] = "ندارد"
        elif role == 2:
            print('kargar')
            context['role'] = "ندارد"
        else:
            print('sarparast')
            context['role'] = "دارد"
            sum_price_sarparast = calculate_sarparasti(request, year, month, staff)
            context['sarparasti'] = sum_price_sarparast[2]
            context['day_sarparasti'] = sum_price_sarparast[0]
            context['one_sarparasti_price'] = sum_price_sarparast[1]

    else:
        messages.error(request, "هنوز اطلاعاتی بابت حقوق برای ایشان درج نشده است")
        return HttpResponseRedirect(reverse_lazy('staff-list', kwargs={'pk': location.pk}))
    return render(request, 'hoghoogh/checklist.html', context=context)


@login_required()
def add_hoghogh_first(request, pk):
    staff = Staff.objects.filter(pk=pk).first()
    location = staff.location
    hoghooghexist = Hoghoogh.objects.filter(staff_id=staff.pk)
    if hoghooghexist:
        hoghooghexist = hoghooghexist.first()
        form = forms.HoghooghFormFirst(request.POST, instance=hoghooghexist)
    else:
        form = forms.HoghooghFormFirst(request.POST)

    if form.is_valid():
        hoghoogh_first = form.save(commit=False)
        hoghoogh_first.staff = staff
        hoghoogh_first.sum_calculate = 0
        hoghoogh_first.sum_all = 0
        hoghoogh_first.days = 0
        hoghoogh_first.bime = 0
        hoghoogh_first.karaee = 0
        hoghoogh_first.pele_price = 0
        hoghoogh_first.sarparasti = 0
        hoghoogh_first.total_pay = 0
        hoghoogh_first.amar = {}
        hoghoogh_first.save()
        messages.info(request, "اطلاعات تکمیلی با موفقیت بروزرسانی شد")
        return HttpResponseRedirect(reverse_lazy('amar', kwargs={'pk': staff.pk}))

    messages.info(request, "اطلاعات تکمیلی بدون تغییر باقی ماند")
    return HttpResponseRedirect(reverse_lazy('amar', kwargs={'pk': staff.pk}))


@login_required()
def update_sarparast_check_role(request, year, month, staff):

    sarparasti = Sarparasti.objects.filter(year=year).filter(month=month).filter(staff_id=staff.pk)
    if sarparasti:
        oldsarparasti = sarparasti.first()
        oldsarparasti.role = staff.role
        oldsarparasti.save()


@login_required()
def update_sarparastha(request, ok_day, year, month, staff):

    location_id = staff.location_id
    sarparasti = Sarparasti.objects.filter(year=year).filter(month=month).filter(staff_id=staff.pk)
    if sarparasti:
        oldsarparasti = sarparasti.first()
        oldsarparasti.sum_day_sarparast = ok_day
        oldsarparasti.role = staff.role
        oldsarparasti.save()

    else:
        newsarparasti = Sarparasti(sum_day_sarparast=ok_day, year=year, month=month, staff_id=staff.pk,
                                   location_id=location_id, role=staff.role)
        newsarparasti.save()


@login_required()
def sum_tolid(request, year, month, staff):
    location_id = staff.location_id
    tolid = Tolid.objects.filter(year=year, month=month, location_id=location_id)
    if tolid:
        oldtolid = tolid.first()
        amar = Amar.objects.filter(type='dates')
        if amar:
            amar2 = amar.select_related('listprice').all().order_by('tarikh')
            amar3 = amar2.aggregate(sum_all=Sum(F('price') * F('tedad')))
            oldtolid.sum_tolid = amar3['sum_all']
        else:
            oldtolid.sum_tolid = 0
        oldtolid.save()
    else:
        amar = Amar.objects.filter(type='dates')
        if amar:
            amar2 = amar.select_related('listprice').all().order_by('tarikh')
            amar3 = amar2.aggregate(sum_all=Sum(F('price') * F('tedad')))
            new_sum_tolid = amar3['sum_all']

        else:
            new_sum_tolid = 0

        newtolid = Tolid(sum_tolid=new_sum_tolid, year=year, month=month, location_id=location_id)
        newtolid.save()


@login_required()
def calculate_sarparasti(request, year, month, staff):
    result_sarparasti = []
    sum_price_sarparasti = 0
    all_day_sarparastha = 0
    location_id = staff.location_id
    sarparasti = Sarparasti.objects.filter(year=year).filter(month=month).filter(role=3)
    if sarparasti:
        settinghoghoogh = SettingHoghoogh.objects.filter(location=staff.location).first()
        darsad_sarparast = settinghoghoogh.darsad_sarparast
        sarparst = sarparasti.filter(staff_id=staff.pk).first()
        day_sarparast = sarparst.sum_day_sarparast
        all_day_sarparastha = sarparasti.aggregate(sum_all_day=Sum(F('sum_day_sarparast')))
        all_days = all_day_sarparastha['sum_all_day']

        tolid = Tolid.objects.filter(year=year, month=month, location_id=location_id)
        if tolid:
            final_tolid = tolid.first()
            sum_tolid_all = final_tolid.sum_tolid
            sum_tolid_calculate = sum_tolid_all * darsad_sarparast / 100

            one_price_sarparasti = sum_tolid_calculate / all_days

            sum_price_sarparasti = day_sarparast * one_price_sarparasti
    result_sarparasti.append(day_sarparast)
    result_sarparasti.append(int(one_price_sarparasti))
    result_sarparasti.append(int(sum_price_sarparasti))
    return result_sarparasti




