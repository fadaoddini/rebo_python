# Generated by Django 4.1.3 on 2023-01-03 05:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hoghoogh', '0004_sarparasti'),
    ]

    operations = [
        migrations.AddField(
            model_name='amar',
            name='type',
            field=models.CharField(default=1, max_length=42),
            preserve_default=False,
        ),
    ]
