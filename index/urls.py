from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products
from index.views import index

urlpatterns = [
    path('', index, name='index'),

]
