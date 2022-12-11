# Generated by Django 4.1.3 on 2022-12-04 09:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomerBalance',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('balance', models.BigIntegerField()),
                ('created_time', models.DateTimeField(auto_now_add=True)),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, related_name='balance_records', to='company.customer')),
            ],
            options={
                'verbose_name': 'Balance',
                'verbose_name_plural': 'Balances',
            },
        ),
        migrations.CreateModel(
            name='TransferWarehouse',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.BigIntegerField()),
                ('sender_name', models.CharField(max_length=48)),
                ('received_name', models.CharField(max_length=48)),
                ('created_time', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.AddField(
            model_name='warehouse',
            name='driver',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.RESTRICT, related_name='driver_warehouse', to='company.driver'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='warehouse',
            name='company',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, related_name='company_warehouse', to='company.company'),
        ),
        migrations.AlterField(
            model_name='warehouse',
            name='customer',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, related_name='warehouse', to='company.customer'),
        ),
        migrations.DeleteModel(
            name='CompanyBalance',
        ),
        migrations.AddField(
            model_name='transferwarehouse',
            name='received_transfer',
            field=models.OneToOneField(on_delete=django.db.models.deletion.RESTRICT, related_name='received_transfer', to='company.warehouse'),
        ),
        migrations.AddField(
            model_name='transferwarehouse',
            name='sender_transfer',
            field=models.OneToOneField(on_delete=django.db.models.deletion.RESTRICT, related_name='sender_transfer', to='company.warehouse'),
        ),
    ]