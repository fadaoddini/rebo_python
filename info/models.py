from django.contrib.auth.models import User
from django.db import models


class Info(models.Model):
    ACTIVE = True
    INACTIVE = False

    STATUS_INFO = (
        (ACTIVE, 'active'),
        (INACTIVE, 'inactive'),
    )
    name = models.CharField(max_length=32)
    family = models.CharField(max_length=32)
    mobile = models.CharField(max_length=20)
    image = models.ImageField(upload_to='users/')
    shaba = models.CharField(max_length=24)
    image_shaba = models.ImageField(upload_to='shabas/')
    codemeli = models.CharField(max_length=24)
    image_codemeli = models.ImageField(upload_to='codemelis/')
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='info')
    create_time = models.DateTimeField(auto_now_add=True)
    modified_time = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(choices=STATUS_INFO, default=INACTIVE)

    def __str__(self):
        return str(self.user)