# Generated by Django 3.2 on 2023-07-12 11:09

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0060_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('c2e23227-a059-4c21-b99c-e4e7258985a8'), unique=True),
        ),
    ]
