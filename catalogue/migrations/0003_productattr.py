# Generated by Django 3.2 on 2023-01-11 09:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('catalogue', '0002_auto_20230111_0851'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProductAttr',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=32)),
                ('value', models.CharField(max_length=48)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='attrs', to='catalogue.product')),
            ],
        ),
    ]
