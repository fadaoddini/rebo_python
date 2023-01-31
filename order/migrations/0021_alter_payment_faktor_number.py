# Generated by Django 3.2 on 2023-01-30 09:18

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0020_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('009a259c-5d17-408f-8886-930c84f6ab10'), unique=True),
        ),
    ]