# Generated by Django 3.2 on 2022-12-05 12:27

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0010_alter_customerbalance_typedate'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='customerbalance',
            name='typedate',
        ),
    ]
