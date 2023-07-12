# Generated by Django 3.2 on 2023-02-20 11:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0008_alter_staff_codemeli'),
        ('hoghoogh', '0015_amararchive'),
    ]

    operations = [
        migrations.AddField(
            model_name='amar',
            name='location',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='amar', to='company.location'),
            preserve_default=False,
        ),
    ]
