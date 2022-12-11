# Generated by Django 3.2 on 2022-12-05 12:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0011_remove_customerbalance_typedate'),
    ]

    operations = [
        migrations.AddField(
            model_name='customerbalance',
            name='typedate',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.RESTRICT, related_name='balance_types', to='company.typedates'),
            preserve_default=False,
        ),
    ]
