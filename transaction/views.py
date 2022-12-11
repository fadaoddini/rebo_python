from django.http import HttpResponse

from transaction.models import Transaction, UserBalance, TransferTransaction, UserScore


def transaction_list(request):
    return HttpResponse("transaction list")


def get_report(request):
    users = Transaction.get_report()

    for user in users:
        context = ''.join(f"balance is : {user.balance} - and num transaction is : {user.transaction_count}")

    return HttpResponse(context)


def get_report_by_user(request, pk):
    user = Transaction.get_report_by_user(pk)
    context = ''.join(f"balance is : {user['balance']} - and num transaction is : {user['transaction_count']}")

    return HttpResponse(context)


def add_balance_user(request, pk):
    result = UserBalance.record_user_by_id_balance(pk)

    return HttpResponse(f"add balance by user : {pk} ---- {result} ")


def add_balance_all_user(request):
    UserBalance.record_all_user_balance()
    return HttpResponse(f"add balance all user result")


def transfer_transaction(request, sender, receiver, amount):
    TransferTransaction.transfer(sender, receiver, amount)
    return HttpResponse("ok")


def add_score_user(request, pk, score):
    instance = UserScore.user_score(pk, score)
    return HttpResponse(instance)
