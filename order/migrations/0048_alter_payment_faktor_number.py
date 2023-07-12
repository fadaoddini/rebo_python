# Generated by Django 3.2 on 2023-05-06 21:42

from django.db import migrations, models
import uuid


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0047_alter_payment_faktor_number'),
    ]

    operations = [
        migrations.AlterField(
            model_name='payment',
            name='faktor_number',
            field=models.UUIDField(default=uuid.UUID('cb885976-229d-4ef6-9495-0ff7d2087b23'), unique=True),
        ),
    ]
