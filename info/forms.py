from django import forms

from info.models import Info
from login.models import MyUser


class InfoUserForm(forms.ModelForm):
    class Meta:
        model = Info
        fields = ['shaba', 'image_shaba', 'codemeli', 'image_codemeli']
        # exclude = ['user', 'is_active']

    # def clean_shaba(self):
    #     shaba = self.cleaned_data['shaba']
    #
    #     if len(shaba) != 24:
    #         raise ValidationError("شماره شبا وارد شده معتبر نیست")
    #     return shaba

    # def clean_codemeli(self):
    #     codemeli = self.cleaned_data['codemeli']
    #
    #     if len(codemeli) != 10:
    #         raise ValidationError("کد ملی وارد شده معتبر نیست")
    #     return codemeli


class ProfileImageForm(forms.ModelForm):
    class Meta:
        model = MyUser
        fields = ['image']
