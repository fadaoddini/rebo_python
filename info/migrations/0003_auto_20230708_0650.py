# Generated by Django 3.2 on 2023-07-08 06:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('info', '0002_auto_20230708_0303'),
    ]

    operations = [
        migrations.AlterField(
            model_name='info',
            name='codemeli',
            field=models.CharField(max_length=24, unique=True),
        ),
        migrations.AlterField(
            model_name='info',
            name='shaba',
            field=models.CharField(max_length=24, unique=True),
        ),
    ]