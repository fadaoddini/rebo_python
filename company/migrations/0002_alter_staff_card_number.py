# Generated by Django 3.2 on 2023-01-05 10:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='staff',
            name='card_number',
            field=models.CharField(max_length=48),
        ),
    ]