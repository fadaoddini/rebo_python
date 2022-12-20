from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products
from login.views import register_user, verify_otp

urlpatterns = [
    path('', register_user, name='login-mobile'),
    path('verify/', verify_otp, name='verify-otp'),
]
