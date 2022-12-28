from django.contrib.auth.models import User
from django.db import models
from django.contrib.auth import get_user_model as user_model


class Info(models.Model):
    ACTIVE = True
    INACTIVE = False

    STATUS_INFO = (
        (ACTIVE, 'active'),
        (INACTIVE, 'inactive'),
    )
    User = user_model()
    name = models.CharField(max_length=32)
    family = models.CharField(max_length=32)
    image = models.ImageField(upload_to='%Y/%m/%d/users/')
    shaba = models.CharField(max_length=24)
    image_shaba = models.ImageField(upload_to='%Y/%m/%d/shabas/')
    codemeli = models.CharField(max_length=24)
    image_codemeli = models.ImageField(upload_to='%Y/%m/%d/codemelis/')
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='info')
    create_time = models.DateTimeField(auto_now_add=True)
    modified_time = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(choices=STATUS_INFO, default=INACTIVE)
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.user)