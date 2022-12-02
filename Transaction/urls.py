from django.urls import path, re_path

from catalogue.views import product_list

urlpatterns = [
    path('product/list/', product_list, name='product-list'),

]
