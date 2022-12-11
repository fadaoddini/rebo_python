from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products

urlpatterns = [
    path('product/list/', product_list, name='product-list'),
    path('product/detail/<int:pk>/', product_detail, name='product-detail'),
    path('category/<int:pk>/products/', category_products, name='category_products'),
    path('brand/<int:pk>/products/', brand_products, name='brand_products'),

]
