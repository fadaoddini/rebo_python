# Generated by Django 3.2 on 2023-01-31 15:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('learn', '0004_auto_20230130_0922'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='category',
            options={'verbose_name': 'Category', 'verbose_name_plural': 'Categories'},
        ),
        migrations.AddField(
            model_name='lesson',
            name='three1',
            field=models.FileField(blank=True, null=True, upload_to='%Y/%m/%d/three1/'),
        ),
        migrations.AddField(
            model_name='lesson',
            name='three2',
            field=models.FileField(blank=True, null=True, upload_to='%Y/%m/%d/three2/'),
        ),
    ]
