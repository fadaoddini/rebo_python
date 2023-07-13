from django.urls import path, re_path

from catalogue.views import product_list, category_products, brand_products
from index.views import Profile, MainIndex, MainAdmin, MainIndexSearch, update_info, update_info_image

urlpatterns = [
    # path('', MainAdmin.as_view(), name='index'),
    # path('admin/admin/', MainIndex.as_view(), name='administrator'),
    path('', MainIndex.as_view(), name='index'),
    path('search/', MainIndexSearch.as_view(), name='index-search'),
    path('admin/admin/', MainAdmin.as_view(), name='administrator'),
    path('profile/', Profile.as_view(), name='profile'),
    path('update/profile/', update_info, name='update-info-profile'),
    path('update/profile/image/', update_info_image, name='update-info-profile-image'),

]
