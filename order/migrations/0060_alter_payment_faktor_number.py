# Generated by Django 3.2 on 2023-07-12 11:06

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0059_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('99adecb2-0095-4975-a71b-3a33181a45a8'), unique=True),
        ),
    ]