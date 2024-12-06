# Generated by Django 5.0.6 on 2024-06-18 09:09

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0016_chitietchuyenkho_kho_chuyen_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='chitietchuyenkho',
            name='kho_chuyen',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='chuyen_kho', to='app.kho'),
        ),
        migrations.AlterField(
            model_name='chitietchuyenkho',
            name='kho_nhan',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='nhan_kho', to='app.kho'),
        ),
    ]