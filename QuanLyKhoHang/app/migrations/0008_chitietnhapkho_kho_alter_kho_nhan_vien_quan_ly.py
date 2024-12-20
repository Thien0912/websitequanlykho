# Generated by Django 5.0 on 2024-06-17 06:55

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0007_alter_kho_nhan_vien_quan_ly'),
    ]

    operations = [
        migrations.AddField(
            model_name='chitietnhapkho',
            name='kho',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='app.kho'),
        ),
        migrations.AlterField(
            model_name='kho',
            name='nhan_vien_quan_ly',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='kho_quan_ly', to='app.nhanvien'),
        ),
    ]
