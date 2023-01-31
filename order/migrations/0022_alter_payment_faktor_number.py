# Generated by Django 3.2 on 2023-01-30 09:22

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0021_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('0865ca1c-94ed-4eb2-b824-b088edabf53c'), unique=True),
        ),
    ]