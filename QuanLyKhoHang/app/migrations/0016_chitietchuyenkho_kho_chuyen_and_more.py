# Generated by Django 5.0.6 on 2024-06-18 09:08

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0015_remove_kho_nhan_vien_quan_ly_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='chitietchuyenkho',
            name='kho_chuyen',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='chuyen_kho', to='app.kho'),
        ),
        migrations.AlterField(
            model_name='chitietchuyenkho',
            name='kho_nhan',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='nhan_kho', to='app.kho'),
        ),
    ]
