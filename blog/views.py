from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.


def blog_list(request):
    return HttpResponse("blog list")


def category_blog_list(request):
    return HttpResponse("category blog list")
