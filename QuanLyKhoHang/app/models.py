from dataclasses import field
from email.policy import default
from enum import unique
from django.db import models
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.shortcuts import render, redirect
from django.contrib.auth.models import AbstractUser
from django.core.validators import MinValueValidator
from django.core.exceptions import ValidationError

# Create your models here.

class NhanVien(models.Model):
    nguoi_dung = models.OneToOneField(User, on_delete=models.CASCADE, related_name='nhan_vien_profile')
    ngay_tao = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nguoi_dung.username

class Kho(models.Model):
    ten_kho = models.CharField(max_length=100)
    dia_chi = models.CharField(max_length=255)

    def __str__(self):
        return self.ten_kho

class DonVi(models.Model):
    ten_don_vi = models.CharField(max_length=255)

    def __str__(self):
        return self.ten_don_vi

class KhachHang(models.Model):
    ten = models.CharField(max_length=100)
    dia_chi = models.TextField()
    email = models.EmailField()
    dien_thoai = models.CharField(max_length=20)

    def __str__(self):
        return self.ten
    
class LoaiHang(models.Model):
    ten = models.CharField(max_length=255)

    def __str__(self):
        return self.ten

class NhaCungCap(models.Model):
    ten = models.CharField(max_length=255)
    dia_chi = models.TextField()
    email = models.EmailField()
    dien_thoai = models.CharField(max_length=10)

    def __str__(self):
        return self.ten

class NhaSanXuat(models.Model):
    ten = models.CharField(max_length=255)
    dia_chi = models.TextField()
    email = models.EmailField()
    dien_thoai = models.CharField(max_length=10)

    def __str__(self):
        return self.ten

class SanPham(models.Model):
    loai_hang = models.ForeignKey(LoaiHang, on_delete=models.CASCADE)
    nha_cung_cap = models.ForeignKey(NhaCungCap, on_delete=models.CASCADE)
    nha_san_xuat = models.ForeignKey(NhaSanXuat, on_delete=models.CASCADE)
    ten = models.CharField(max_length=255)
    mo_ta = models.TextField()
    image = models.ImageField(null= True, blank= True)
    gia = models.IntegerField()

    def __str__(self):
        return self.ten
    @property
    def ImageURL(self):
        try:
            url= self.image.url
        except:
            url = ''
        return url
    
class TonKho(models.Model):
    kho = models.ForeignKey(Kho, on_delete=models.CASCADE, related_name='ton_kho')
    san_pham = models.ForeignKey(SanPham, on_delete=models.CASCADE)
    so_luong = models.IntegerField(default=0)
    don_vi = models.ForeignKey(DonVi, on_delete=models.CASCADE)

    def clean(self):
        if self.so_luong < 0:
            raise ValidationError("Số lượng không thể âm")

    def __str__(self):
        return f"{self.san_pham}"

class PhieuNhapKho(models.Model):
    ngay_tao = models.DateTimeField(auto_now_add=True)
    nhan_vien = models.ForeignKey(NhanVien, on_delete=models.CASCADE)

    def __str__(self):
        return f"Phiếu nhập kho {self.id} - Nhân viên: {self.nhan_vien}"
    
    def calculate_total(self):
        total = 0
        chi_tiet_xuat_list = self.chi_tiet_xuat.all()
        for chi_tiet_xuat in chi_tiet_xuat_list:
            total += chi_tiet_xuat.so_luong * chi_tiet_xuat.gia
        return total

class ChiTietNhapKho(models.Model):
    phieu_nhap_kho = models.ForeignKey(PhieuNhapKho, on_delete=models.CASCADE, related_name='chi_tiet_nhap')
    san_pham = models.ForeignKey('SanPham', on_delete=models.CASCADE)
    so_luong = models.IntegerField()
    tong_tien = models.IntegerField()
    don_vi = models.ForeignKey('DonVi', on_delete=models.CASCADE)
    kho = models.ForeignKey('Kho', on_delete=models.CASCADE)

    class Meta:
        unique_together = (('phieu_nhap_kho', 'san_pham'),)

    def clean(self):
        if self.so_luong < 0:
            raise ValidationError("Số lượng không thể âm")

    def __str__(self):
        return f"Phiếu nhập kho {self.id}"
    
    def save(self, *args, **kwargs):
        self.tong_tien = self.so_luong * self.san_pham.gia
        super().save(*args, **kwargs)

class PhieuXuatKho(models.Model):
    ngay_tao = models.DateTimeField(auto_now_add=True)
    khach_hang = models.ForeignKey(KhachHang, on_delete=models.CASCADE)
    nhan_vien = models.ForeignKey(NhanVien, on_delete=models.CASCADE)
    tong_tien = models.IntegerField(default=0)

    def __str__(self):
        return f"Phiếu xuất kho {self.id} - {self.ngay_tao}"

    def calculate_total(self):
        total = 0
        chi_tiet_xuat_list = self.chi_tiet_xuat.all()
        for chi_tiet_xuat in chi_tiet_xuat_list:
            total += chi_tiet_xuat.so_luong * chi_tiet_xuat.gia
        return total

class ChiTietXuatKho(models.Model):
    phieu_xuat_kho = models.ForeignKey(PhieuXuatKho, on_delete=models.CASCADE, related_name='chi_tiet_xuat')
    san_pham = models.ForeignKey(SanPham, on_delete=models.CASCADE)
    so_luong = models.IntegerField()
    gia = models.IntegerField()
    don_vi = models.ForeignKey(DonVi, on_delete=models.CASCADE)
    kho = models.ForeignKey(Kho, on_delete=models.CASCADE)

    class Meta:
        unique_together = (('phieu_xuat_kho', 'san_pham'),)

    def clean(self):
        if self.so_luong < 0:
            raise ValidationError("Số lượng không thể âm")

    def __str__(self):
        return f"{self.phieu_xuat_kho} - {self.san_pham} - {self.so_luong}"
    
    def clean(self):
        super().clean()
        ton_kho = self.san_pham.tonkho_set.first()
        if self.so_luong > ton_kho.so_luong:
            raise ValidationError("Số lượng xuất kho không được lớn hơn số lượng tồn kho.")
        
    def save(self, *args, **kwargs):
        self.gia = self.so_luong * self.san_pham.gia * 0.05
        super().save(*args, **kwargs)

class PhieuChuyenKho(models.Model):
    ngay_tao = models.DateTimeField(auto_now_add=True)
    nhan_vien = models.ForeignKey(NhanVien, on_delete=models.CASCADE)

    def __str__(self):
        return f"Phiếu chuyển kho {self.id}"

class ChiTietChuyenKho(models.Model):
    phieu_chuyen_kho = models.ForeignKey(PhieuChuyenKho, on_delete=models.CASCADE, related_name='chi_tiet_chuyen')
    san_pham = models.ForeignKey(SanPham, on_delete=models.CASCADE)
    so_luong = models.IntegerField()
    don_vi = models.ForeignKey(DonVi, on_delete=models.CASCADE)
    kho_chuyen = models.ForeignKey(Kho, related_name='chuyen_kho', on_delete=models.CASCADE)
    kho_nhan = models.ForeignKey(Kho, related_name='nhan_kho', on_delete=models.CASCADE)

    class Meta:
        unique_together = (('phieu_chuyen_kho', 'san_pham'),)

    def __str__(self):
        return f"Phiếu chuyển kho {self.phieu_chuyen_kho}"
    
    def clean(self):
        if self.so_luong < 0:
            raise ValidationError("Số lượng không thể âm")
        
@receiver(post_save, sender=Kho)
def create_ton_kho_for_new_kho(sender, instance, created, **kwargs):
    if created:
        # Lấy đối tượng DonVi với tên là "Chai"
        try:
            don_vi_chai = DonVi.objects.get(ten_don_vi="Chai")
        except DonVi.DoesNotExist:
            # Xử lý trường hợp không tìm thấy DonVi
            return
        
        # Lấy danh sách tất cả sản phẩm
        all_san_pham = SanPham.objects.all()
        
        # Tạo tồn kho mặc định (0) cho mỗi sản phẩm trong kho mới
        for san_pham in all_san_pham:
            TonKho.objects.create(
                kho=instance,
                san_pham=san_pham,
                so_luong=0,
                don_vi=don_vi_chai  # Gán đối tượng DonVi đã lấy được
            )