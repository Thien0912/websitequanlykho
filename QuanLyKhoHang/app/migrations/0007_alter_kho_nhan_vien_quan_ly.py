# Generated by Django 5.0 on 2024-06-17 06:24

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_alter_kho_nhan_vien_quan_ly'),
    ]

    operations = [
        migrations.AlterField(
            model_name='kho',
            name='nhan_vien_quan_ly',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.nhanvien'),
        ),
    ]