from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponse
from django.shortcuts import render
from django.views.decorators.http import require_http_methods

from company.models import Warehouse, CustomerBalance, TransferWarehouse


def customer_list(request):
    return HttpResponse("customer list")


def get_report(request):
    customers = Warehouse.get_report()

    for customer in customers:
        context = ''.join(f"balance is : {customer.balance} - and num transaction is : {customer.transfer_count}")

    return HttpResponse(context)


def get_report_by_customer(request, pk):
    customer = Warehouse.get_report_by_customer(pk)
    context = ''.join(f"balance is : {customer['balance']} - and num transaction is : {customer['transaction_count']}")

    return HttpResponse(context)


def add_balance_customer(request, pk, typedate):
    result = CustomerBalance.record_customer_by_id_balance(pk, typedate)

    return HttpResponse(f"add balance by user : {pk} -- {typedate} -- {result} ")


@login_required()
@require_http_methods(request_method_list=['GET'])
@user_passes_test(lambda u: u.is_active)
def add_balance_all_customer(request):
    CustomerBalance.record_all_customer_balance()
    return HttpResponse(f"record all customer balance result")


def transfer_transaction(request, sender, receiver, typedate, quantity, driver):
    instance = TransferWarehouse.transfer(sender, receiver, typedate, quantity, driver)
    return HttpResponse(f"{instance}")
