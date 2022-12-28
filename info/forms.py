from django import forms
from django.core.exceptions import ValidationError

from info.models import Info
from lib.validators import check_shaba_validator


class InfoUserForm(forms.ModelForm):
    class Meta:
        model = Info
        fields = ['name', 'family', 'image', 'shaba', 'image_shaba', 'codemeli', 'image_codemeli']
        # exclude = ['user', 'is_active']

    def clean_shaba(self):
        shaba = self.cleaned_data['shaba']

        if len(shaba) != 24:
            raise ValidationError("شماره شبا وارد شده معتبر نیست")
        return shaba
