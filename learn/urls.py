from django.urls import path, re_path

from learn.views import Learn

urlpatterns = [
    path('', Learn.as_view(), name='learn'),
]
