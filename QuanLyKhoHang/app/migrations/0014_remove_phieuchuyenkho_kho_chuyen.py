# Generated by Django 5.0.6 on 2024-06-17 15:06

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_remove_phieuchuyenkho_tong_tien'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='phieuchuyenkho',
            name='kho_chuyen',
        ),
    ]