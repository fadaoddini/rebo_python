# Generated by Django 3.2 on 2023-04-17 13:36

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0033_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('ed2c1197-3791-4bae-bb16-17279bcc2506'), unique=True),
        ),
    ]
