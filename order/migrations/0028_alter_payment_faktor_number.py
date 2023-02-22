# Generated by Django 3.2 on 2023-02-20 11:18

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0027_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('4b6a7efd-9572-403e-81e1-891dda582052'), unique=True),
        ),
    ]