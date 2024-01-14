# Generated by Django 4.2 on 2024-01-12 14:48

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('info', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ServiceType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=32)),
            ],
            options={
                'verbose_name': 'Service',
                'verbose_name_plural': 'Services',
            },
        ),
        migrations.CreateModel(
            name='Storage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lat', models.CharField(blank=True, max_length=40, null=True)),
                ('long', models.CharField(blank=True, max_length=40, null=True)),
                ('capacity', models.CharField(blank=True, max_length=40, null=True)),
                ('score', models.PositiveBigIntegerField(default=0)),
                ('image', models.ImageField(blank=True, null=True, upload_to='%Y/%m/%d/farmer/')),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('modified_time', models.DateTimeField(auto_now=True)),
                ('is_accept', models.BooleanField(choices=[(True, 'yes'), (False, 'no')], default=False)),
                ('is_active', models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='storage', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Service',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('unm', models.PositiveBigIntegerField(default=1)),
                ('score', models.PositiveBigIntegerField(default=0)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('modified_time', models.DateTimeField(auto_now=True)),
                ('is_active', models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False)),
                ('service_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='services', to='info.servicetype')),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='service', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Farmer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('lat', models.CharField(blank=True, max_length=40, null=True)),
                ('long', models.CharField(blank=True, max_length=40, null=True)),
                ('number_tree', models.CharField(blank=True, max_length=40, null=True)),
                ('score', models.PositiveBigIntegerField(default=0)),
                ('image', models.ImageField(blank=True, null=True, upload_to='%Y/%m/%d/farmer/')),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('modified_time', models.DateTimeField(auto_now=True)),
                ('is_active', models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='farmer', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Broker',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('score', models.PositiveBigIntegerField(default=0)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('modified_time', models.DateTimeField(auto_now=True)),
                ('is_active', models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='broker', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
