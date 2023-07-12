# Generated by Django 3.2 on 2023-01-11 09:18

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0003_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('7aed0167-6e9b-4f87-a4a9-7da74965d496'), unique=True),
        ),
    ]
