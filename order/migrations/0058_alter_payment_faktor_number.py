# Generated by Django 3.2 on 2023-07-08 06:52

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0057_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('e1c8b327-c3d1-4164-bd68-c6022fe15d95'), unique=True),
        ),
    ]
