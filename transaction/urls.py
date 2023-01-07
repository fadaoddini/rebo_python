from django.urls import path, re_path

from transaction.views import transaction_list, get_report, \
    wallet, add_balance_user, add_balance_all_user, \
    transfer_transaction, add_score_user, list_send_wallet, add_wallet, send_wallet, form_add_wallet, \
    form_send_wallet, check_mobile_wallet, list_received_wallet

urlpatterns = [
    path('list/', transaction_list, name='transaction-list'),
    path('report/all/', get_report, name='report-all'),
    path('wallet/<int:pk>/', wallet, name='get-wallet-user'),
    path('list/wallet/<int:pk>/', list_send_wallet, name='list-send-wallet-user'),
    path('list_received/wallet/<int:pk>/', list_received_wallet, name='list-received-wallet-user'),
    path('add/wallet/<int:pk>/', add_wallet, name='add-wallet-by-user'),
    path('send/wallet/<int:pk>/', send_wallet, name='send-wallet-by-user'),
    path('bank/wallet/<int:pk>/', form_add_wallet, name='add-money-by-user'),
    path('checkout/wallet/<int:pk>/', check_mobile_wallet, name='check-mobile-receiver-wallet'),
    path('resend/wallet/<int:pk>/', form_send_wallet, name='send-money-by-user'),
    path('balance/user/<int:pk>/', add_balance_user, name='add_balance_user'),
    path('balance/all/', add_balance_all_user, name='add_balance_all_user'),
    path('transfer/<int:sender>/<int:receiver>/<int:amount>/',
         transfer_transaction, name='add_balance_all_user'),
    path('score/user/<int:pk>/<int:score>/', add_score_user, name='add_score_user'),

]
