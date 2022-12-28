from django.urls import path, re_path

from hoghoogh.views import hoghoogh_list, setting_hoghoogh, update_setting_hoghoogh, \
    update_setting_hoghoogh_send, update_setting_hoghoogh_edit, listprice, add_listprice, add_amar, amar

urlpatterns = [
    path('list/', hoghoogh_list, name='hoghoogh_list'),
    path('setting_h/', setting_hoghoogh, name='setting-hoghoogh'),
    path('setting_h_u/<int:pk>/', update_setting_hoghoogh, name='update-setting-hoghoogh'),
    path('setting_h_u_s/<int:pk>/', update_setting_hoghoogh_send, name='update-setting-hoghoogh-send'),
    path('setting_h_u_e/<int:pk>/', update_setting_hoghoogh_edit, name='update-setting-hoghoogh-edit'),
    path('listprice/<int:pk>/', listprice, name='listprice'),
    path('add_listprice/<int:pk>/', add_listprice, name='add-listprice'),
    path('amar/<int:pk>/', amar, name='amar'),
    path('add_amar/<int:pk>/', add_amar, name='add-amar'),
]
