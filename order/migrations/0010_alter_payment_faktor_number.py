# Generated by Django 3.2 on 2023-01-15 22:28

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0009_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('3be4de92-cc0b-4b49-b428-36727763379b'), unique=True),
        ),
    ]