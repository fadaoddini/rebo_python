# Generated by Django 4.2 on 2024-01-12 11:07

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Info',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32)),
                ('family', models.CharField(max_length=32)),
                ('image', models.ImageField(blank=True, null=True, upload_to='%Y/%m/%d/users/')),
                ('shaba', models.CharField(blank=True, max_length=24, null=True, unique=True)),
                ('image_shaba', models.ImageField(blank=True, null=True, upload_to='%Y/%m/%d/shabas/')),
                ('codemeli', models.CharField(blank=True, max_length=24, null=True, unique=True)),
                ('okmeli', models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False)),
                ('okbank', models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False)),
                ('image_codemeli', models.ImageField(blank=True, null=True, upload_to='%Y/%m/%d/codemelis/')),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('modified_time', models.DateTimeField(auto_now=True)),
                ('is_active', models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False)),
                ('uploaded_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='info', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
