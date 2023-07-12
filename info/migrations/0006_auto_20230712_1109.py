# Generated by Django 3.2 on 2023-07-12 11:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('info', '0005_auto_20230712_1106'),
    ]

    operations = [
        migrations.AlterField(
            model_name='info',
            name='codemeli',
            field=models.CharField(default=1, max_length=24, unique=True),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='info',
            name='family',
            field=models.CharField(default=1, max_length=32),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='info',
            name='name',
            field=models.CharField(max_length=32),
        ),
        migrations.AlterField(
            model_name='info',
            name='shaba',
            field=models.CharField(max_length=24, unique=True),
        ),
    ]
