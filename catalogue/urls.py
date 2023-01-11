from django.urls import path, re_path

from catalogue.views import product_list, product_detail, category_products, brand_products, add_product, add_request, \
    my_product_list, my_request_list, form_add_product, check_type_product_ajax

urlpatterns = [
    path('product/list/', product_list, name='product-list'),
    path('add_product/<int:pk>/', add_product, name='add_product'),
    path('check_type_product_ajax/', check_type_product_ajax, name='check-type-product-ajax'),
    path('send/add_product/', form_add_product, name='form-add-product'),
    path('add_request/<int:pk>/', add_request, name='add_request'),
    path('my_product_list/<int:pk>/', my_product_list, name='my_product_list'),
    path('my_request_list/<int:pk>/', my_request_list, name='my_request_list'),
    path('product/detail/<int:pk>/', product_detail, name='product-detail'),
    path('category/<int:pk>/products/', category_products, name='category_products'),
    path('brand/<int:pk>/products/', brand_products, name='brand_products'),

]
