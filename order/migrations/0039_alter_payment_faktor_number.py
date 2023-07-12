# Generated by Django 3.2 on 2023-04-17 15:13

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0038_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('9f642eac-e06c-4e36-88bd-219cad90591e'), unique=True),
        ),
    ]
