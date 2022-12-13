# Generated by Django 3.2 on 2022-12-12 14:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('info', '0003_alter_info_is_active'),
    ]

    operations = [
        migrations.AlterField(
            model_name='info',
            name='is_active',
            field=models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False),
        ),
    ]
