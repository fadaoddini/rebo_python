# Generated by Django 3.2 on 2023-01-30 09:16

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0019_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('5a7eb050-d766-4b79-90b9-b29934728d79'), unique=True),
        ),
    ]
