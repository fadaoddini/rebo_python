from django.db.models import Q
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.shortcuts import render


def info(request):
    context = dict()
    context['user'] = User.objects.all()

    return render(request, 'index/index.html', context=context)