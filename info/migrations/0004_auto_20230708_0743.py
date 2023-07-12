# Generated by Django 3.2 on 2023-07-08 07:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('info', '0003_auto_20230708_0650'),
    ]

    operations = [
        migrations.AddField(
            model_name='info',
            name='okbank',
            field=models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False),
        ),
        migrations.AddField(
            model_name='info',
            name='okmeli',
            field=models.BooleanField(choices=[(True, 'active'), (False, 'inactive')], default=False),
        ),
    ]
