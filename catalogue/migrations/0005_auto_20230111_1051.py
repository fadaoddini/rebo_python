# Generated by Django 3.2 on 2023-01-11 10:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('catalogue', '0004_auto_20230111_0918'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productattr',
            name='product',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='attrs', to='catalogue.product'),
        ),
        migrations.AlterField(
            model_name='productattr',
            name='title',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='type', to='catalogue.productattribute'),
        ),
        migrations.AlterField(
            model_name='productattr',
            name='value',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.PROTECT, related_name='values', to='catalogue.productattributevalue'),
        ),
        migrations.AlterField(
            model_name='productimage',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='products/'),
        ),
    ]
