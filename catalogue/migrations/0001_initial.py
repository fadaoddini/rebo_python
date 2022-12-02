# Generated by Django 4.1.3 on 2022-11-30 19:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32)),
                ('parent', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='children_brand', to='catalogue.brand')),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=32)),
                ('parent', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='children_category', to='catalogue.category')),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('upc', models.BigIntegerField(unique=True)),
                ('title', models.CharField(max_length=32)),
                ('description', models.TextField(blank=True)),
                ('brand_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='products_brand', to='catalogue.brand')),
                ('category_id', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='products_category', to='catalogue.category')),
            ],
        ),
        migrations.CreateModel(
            name='ProductAttribute',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=32)),
                ('attribute_type', models.PositiveSmallIntegerField(choices=[(1, 'Integer'), (2, 'String'), (3, 'Float')], default=1)),
            ],
        ),
        migrations.CreateModel(
            name='ProductType',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(blank=True, max_length=32, null=True)),
            ],
            options={
                'verbose_name': 'ProductType',
                'verbose_name_plural': 'productTypes',
            },
        ),
        migrations.CreateModel(
            name='ProductAttributeValue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.CharField(max_length=48)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attribute_values', to='catalogue.product')),
                ('product_attribute', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='values', to='catalogue.productattribute')),
            ],
        ),
        migrations.AddField(
            model_name='productattribute',
            name='product_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attributes', to='catalogue.producttype'),
        ),
        migrations.AddField(
            model_name='product',
            name='product_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='products_type', to='catalogue.producttype'),
        ),
    ]
