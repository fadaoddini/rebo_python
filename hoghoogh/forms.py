from django import forms

from hoghoogh.models import SettingHoghoogh, ListPrice, Amar


class SettingHoghooghForm(forms.ModelForm):
    class Meta:
        model = SettingHoghoogh
        fields = ['price_bime_in_day', 'start_end_hoghoogh', 'num_day', 'darsad_all', 'darsad_sarparast',
                  'pele_one_day', 'pele_one_darsad', 'pele_two_day', 'pele_two_darsad',
                  'pele_three_day', 'pele_three_darsad']


class ListPriceForm(forms.ModelForm):
    class Meta:
        model = ListPrice
        fields = ['name', 'price', 'value_type']


class ListAmarForm(forms.ModelForm):
    class Meta:
        model = Amar
        fields = ['name', 'price', 'tedad', 'tarikh']


