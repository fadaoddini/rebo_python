# Generated by Django 4.2 on 2024-01-15 11:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0007_alter_myuser_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='image_profile/7745a096-64a6-4116-b896-ae153275d1be/'),
        ),
    ]
