from django import template
from django.contrib.auth.decorators import login_required

from company.models import Company, Location

register = template.Library()


@login_required
@register.simple_tag
def my_locations(user):
    company = Company.objects.filter(user=user).first()
    mylocations = Location.objects.filter(company=company)

    return mylocations