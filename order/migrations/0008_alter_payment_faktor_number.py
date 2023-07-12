# Generated by Django 3.2 on 2023-01-15 00:41

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0007_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('7e40cec4-3608-466d-b22a-7d9e2de79a3f'), unique=True),
        ),
    ]
