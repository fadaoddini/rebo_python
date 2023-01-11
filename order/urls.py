from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products
from order.views import VerifyView

urlpatterns = [
    path('verify/', VerifyView.as_view(), name='verify-view'),
]
