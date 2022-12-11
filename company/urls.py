from django.urls import path, re_path

from company.views import customer_list, get_report, get_report_by_customer, add_balance_customer, \
    add_balance_all_customer, transfer_transaction

urlpatterns = [
    path('list/', customer_list, name='customer_list'),
    path('report/all/', get_report, name='report_all_customer'),
    path('report/customer/<int:pk>/', get_report_by_customer, name='get_report_by_customer'),
    path('balance/customer/<int:pk>/<int:typedate>/', add_balance_customer, name='add_balance_customer'),
    path('balance/all/', add_balance_all_customer, name='add_balance_all_customer'),
    path('transfer/<int:sender>/<int:receiver>/<int:typedate>/<int:quantity>/<int:driver>/',
         transfer_transaction, name='add_balance_all_customer'),
]
