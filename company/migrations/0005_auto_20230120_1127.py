# Generated by Django 3.2 on 2023-01-20 11:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0004_alter_staff_location'),
    ]

    operations = [
        migrations.AlterField(
            model_name='staff',
            name='age',
            field=models.CharField(blank=True, max_length=48, null=True),
        ),
        migrations.AlterField(
            model_name='staff',
            name='card_number',
            field=models.CharField(blank=True, max_length=48, null=True),
        ),
        migrations.AlterField(
            model_name='staff',
            name='is_married',
            field=models.BooleanField(blank=True, choices=[(True, 'yes'), (False, 'no')], null=True),
        ),
        migrations.AlterField(
            model_name='staff',
            name='jens',
            field=models.PositiveSmallIntegerField(blank=True, choices=[(1, 'man'), (2, 'woman')], null=True),
        ),
        migrations.AlterField(
            model_name='staff',
            name='mobile',
            field=models.CharField(blank=True, max_length=48, null=True),
        ),
        migrations.AlterField(
            model_name='staff',
            name='salon',
            field=models.PositiveSmallIntegerField(default=1),
        ),
    ]
