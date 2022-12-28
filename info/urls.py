from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products
from info.views import info, update_info

urlpatterns = [
    path('', info, name='info'),
    path('update/', update_info, name='update-info'),
]
