# Generated by Django 3.2 on 2023-02-21 18:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0008_alter_staff_codemeli'),
        ('hoghoogh', '0018_auto_20230221_1146'),
    ]

    operations = [
        migrations.AlterField(
            model_name='hoghoogharchive',
            name='staff',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='company.staff'),
        ),
        migrations.AlterField(
            model_name='sarparasti',
            name='staff',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='company.staff'),
        ),
    ]
