from django.db import models
from django.db.models import Sum, Q, Count
from django.db.models.functions import Coalesce

from company.models import Location, Staff


class SettingHoghoogh(models.Model):
    location = models.OneToOneField(Location, on_delete=models.CASCADE)
    price_bime_in_day = models.IntegerField(default=0)
    start_end_hoghoogh = models.CharField(max_length=32)
    num_day = models.IntegerField(default=31)
    darsad_all = models.IntegerField(default=0)
    darsad_sarparast = models.IntegerField(default=0)
    pele_one_day = models.IntegerField(default=0)
    pele_one_darsad = models.IntegerField(default=0)
    pele_two_day = models.IntegerField(default=0)
    pele_two_darsad = models.IntegerField(default=0)
    pele_three_day = models.IntegerField(default=0)
    pele_three_darsad = models.IntegerField(default=0)

    class Meta:
        verbose_name = 'SettingHoghoogh'
        verbose_name_plural = 'SettingHoghooghs'

    def __str__(self):
        return f"{self.location}"


class ListPrice(models.Model):
    ACTIVE = True
    INACTIVE = False

    STATUS_LISTPRICE = (
        (ACTIVE, 'active'),
        (INACTIVE, 'inactive'),
    )

    DATES = 1
    ETC = 2

    VALUE_TYPE_LISTPRICE = (
        (DATES, 'dates'),
        (ETC, 'etc'),
    )
    location = models.ForeignKey(Location, on_delete=models.CASCADE, related_name='listprice')
    name = models.CharField(max_length=42)
    price = models.IntegerField()
    value_type = models.PositiveSmallIntegerField(choices=VALUE_TYPE_LISTPRICE, default=DATES)
    is_active = models.BooleanField(choices=STATUS_LISTPRICE, default=ACTIVE)

    class Meta:
        verbose_name = 'ListPrice'
        verbose_name_plural = 'ListPrices'

    def __str__(self):
        return f"{self.name}"


class Amar(models.Model):
    staff = models.ForeignKey(Staff, on_delete=models.CASCADE, related_name='amar')
    listprice = models.ForeignKey(ListPrice, on_delete=models.CASCADE, related_name='amarlist')
    name = models.CharField(max_length=42)
    price = models.IntegerField()
    tedad = models.IntegerField()
    tarikh = models.CharField(max_length=42)

    class Meta:
        verbose_name = 'Amar'
        verbose_name_plural = 'Amars'

    def __str__(self):
        return f"{self.name}"


class Hoghoogh(models.Model):
    staff = models.ForeignKey(Staff, on_delete=models.CASCADE, related_name='hoghoogh')
    sum_calculate = models.BigIntegerField()
    sum_all = models.BigIntegerField()
    days = models.IntegerField()
    mosaede = models.BigIntegerField(default=0)
    vam = models.BigIntegerField(default=0)
    bime = models.BigIntegerField(default=0)
    tashvighi = models.BigIntegerField(default=0)
    year = models.CharField(max_length=10)
    month = models.CharField(max_length=10)
    karaee = models.FloatField(default=0)
    amar = models.JSONField()

    class Meta:
        verbose_name = 'Hoghoogh'
        verbose_name_plural = 'Hoghooghs'

    def __str__(self):
        return f"{self.sum_calculate}"







