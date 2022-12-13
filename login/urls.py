from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products
from login.views import login, register

urlpatterns = [
    path('', login, name='login'),
    path('register/', register, name='register'),

]
