# Generated by Django 4.1.3 on 2022-12-05 08:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0005_warehouse_typedate'),
    ]

    operations = [
        migrations.AddField(
            model_name='transferwarehouse',
            name='typedate',
            field=models.OneToOneField(default=1, on_delete=django.db.models.deletion.RESTRICT, to='company.typedates'),
            preserve_default=False,
        ),
    ]