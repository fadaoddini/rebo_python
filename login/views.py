from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render

from catalogue.models import Product


def login(request):
    context = dict()

    return render(request, 'login/login.html', context=context)


def register(request):
    context = dict()

    return render(request, 'login/register.html', context=context)
