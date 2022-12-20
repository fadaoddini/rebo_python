from django.urls import path, re_path

from hoghoogh.views import hoghoogh_list

urlpatterns = [
    path('list/', hoghoogh_list, name='hoghoogh_list'),
]
