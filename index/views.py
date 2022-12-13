from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render

from catalogue.models import Product
from company.models import Company
from info.models import Info


def index(request):
    context = dict()
    context['products'] = Product.objects.all()
    context['info'] = Info.objects.filter(user=request.user).first()
    context['company'] = Company.objects.filter(user=request.user).first()

    return render(request, 'index/index.html', context=context)
