# Generated by Django 4.2 on 2024-01-15 10:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0006_alter_myuser_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='image_profile/f1a1e3dd-8057-45b4-8d5c-fecb010bbbf0/'),
        ),
    ]