# Generated by Django 3.2 on 2023-07-08 03:03

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0055_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('5db4f7ff-25c4-45df-a533-1ee3aab495b7'), unique=True),
        ),
    ]