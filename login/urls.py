from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products
from login.views import register_user, verify_otp, SendOtp, VerifyCode

urlpatterns = [
    path('', register_user, name='login-mobile'),
    path('verify/', verify_otp, name='verify-otp'),
    path('sendOtp', SendOtp.as_view(), name='send-otp'),
    path('verifyCode', VerifyCode.as_view(), name='send-otp'),
]
