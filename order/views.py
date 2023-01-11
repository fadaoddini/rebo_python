from django.conf import settings
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View

from order.utils import zpal_payment_checker


# Create your views here.

class VerifyView(View):
    template_name = 'order/verify.html'

    print(template_name)

    def get(self, request, *args, **kwargs):
        authority = request.GET.get('Authority')
        print(authority)
        is_paid, ref_id = zpal_payment_checker(settings.ZARRINPAL['merchant_id'], 1000, authority)
        return render(request, template_name=self.template_name, context={'is_paid': is_paid, 'ref_id': ref_id},
                      content_type=None, status=None, using=None)

