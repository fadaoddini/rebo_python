from django.urls import path, re_path

from transaction.views import transaction_list, get_report, \
    get_report_by_user, add_balance_user, add_balance_all_user, \
    transfer_transaction, add_score_user

urlpatterns = [
    path('list/', transaction_list, name='transaction-list'),
    path('report/all/', get_report, name='report-all'),
    path('report/user/<int:pk>/', get_report_by_user, name='get_report_by_user'),
    path('balance/user/<int:pk>/', add_balance_user, name='add_balance_user'),
    path('balance/all/', add_balance_all_user, name='add_balance_all_user'),
    path('transfer/<int:sender>/<int:receiver>/<int:amount>/',
         transfer_transaction, name='add_balance_all_user'),
    path('score/user/<int:pk>/<int:score>/', add_score_user, name='add_score_user'),

]
