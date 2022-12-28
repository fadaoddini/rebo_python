from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render

from catalogue.models import Product
from company.forms import CompanyForm
from company.models import Company
from info.forms import InfoUserForm
from info.models import Info


def index(request):
    if request.user.is_authenticated:
        context = dict()
        context['products'] = Product.objects.all()
        context['info'] = Info.objects.filter(user=request.user).first()
        context['company'] = Company.objects.filter(user=request.user).first()
        form_info = InfoUserForm()
        context['form_info'] = form_info
        form_company = CompanyForm()
        context['form_company'] = form_company

        return render(request, 'index/index.html', context=context)
    return render(request, 'login/login.html')




