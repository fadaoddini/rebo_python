from django.http import HttpResponse
from catalogue.models import Product


def product_list(request):
    products = Product.objects.all()
    return HttpResponse("product list")


