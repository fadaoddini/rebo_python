# Generated by Django 3.2 on 2023-01-04 22:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hoghoogh', '0008_amar_is_sarparast'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tolid',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sum_tolid', models.BigIntegerField(default=0)),
                ('year_month', models.IntegerField()),
            ],
            options={
                'verbose_name': 'Tolid',
                'verbose_name_plural': 'Tolids',
            },
        ),
        migrations.RemoveField(
            model_name='sarparasti',
            name='sum_tolid_sarparast',
        ),
    ]
