
from django import forms
from django.contrib.auth.models import User
from .models import *
from django.forms.models import inlineformset_factory


class DangKyNhanVienForm(forms.ModelForm):
    username = forms.CharField(max_length=150)
    email = forms.EmailField()
    password1 = forms.CharField(widget=forms.PasswordInput)
    password2 = forms.CharField(widget=forms.PasswordInput, label="Xác nhận mật khẩu")

    class Meta:
        model = NhanVien
        fields = []

    def clean(self):
        cleaned_data = super().clean()
        password1 = cleaned_data.get("password1")
        password2 = cleaned_data.get("password2")

        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Mật khẩu không khớp")

        return cleaned_data

    def save(self, commit=True):
        user = User.objects.create_user(
            username=self.cleaned_data['username'],
            password=self.cleaned_data['password1'],
            email=self.cleaned_data['email']
        )
        if commit:
            user.save()
            nhan_vien = NhanVien.objects.create(nguoi_dung=user)

            # Không cần tạo TonKho trong form này nữa

        return user

class SanPhamForm(forms.ModelForm):
    don_vi = forms.ModelChoiceField(queryset=DonVi.objects.all(), required=True, label='Đơn vị')

    class Meta:
        model = SanPham
        fields = ['ten', 'image', 'mo_ta', 'loai_hang', 'nha_cung_cap', 'nha_san_xuat', 'gia']

class TonKhoForm(forms.ModelForm):
    san_pham = forms.ModelChoiceField(queryset=SanPham.objects.all(), required=True)
    class Meta:
        model = TonKho
        fields = ['san_pham', 'so_luong']

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super(TonKhoForm, self).__init__(*args, **kwargs)
        if user and hasattr(user, 'nhan_vien_profile'):
            self.kho = user.nhan_vien_profile.kho

    def save(self, commit=True):
        instance = super(TonKhoForm, self).save(commit=False)
        if hasattr(self, 'kho'):
            instance.kho = self.kho
        if commit:
            instance.save()
        return instance

class ThongTinKhachHangForm(forms.ModelForm):
    class Meta:
        model = KhachHang
        fields = ['ten', 'dia_chi', 'email', 'dien_thoai']

class NhaCungCapForm(forms.ModelForm):
    class Meta:
        model = NhaCungCap
        fields = ['ten', 'dia_chi', 'email', 'dien_thoai']

class NhaSanXuatForm(forms.ModelForm):
    class Meta:
        model = NhaSanXuat
        fields = ['ten', 'dia_chi', 'email', 'dien_thoai']

class PhieuXuatForm(forms.ModelForm):
    khach_hang = forms.ModelChoiceField(queryset=KhachHang.objects.all())
    
    class Meta:
        model = PhieuXuatKho
        fields = ['khach_hang']

class ChiTietXuatForm(forms.ModelForm):
    san_pham = forms.ModelChoiceField(queryset=SanPham.objects.all(), required=True)
    class Meta:
        model = ChiTietXuatKho
        fields = ['san_pham', 'so_luong', 'don_vi', 'kho']

class PhieuNhapForm(forms.ModelForm):
    class Meta:
        model = PhieuNhapKho
        fields = []

class ChiTietNhapForm(forms.ModelForm):
    san_pham = forms.ModelChoiceField(queryset=SanPham.objects.all(), required=True)
    
    class Meta:
        model = ChiTietNhapKho
        fields = ['san_pham', 'so_luong', 'don_vi', 'kho']

class KhoForm(forms.ModelForm):
    class Meta:
        model = Kho
        fields = ['ten_kho', 'dia_chi']

class PhieuChuyenKhoForm(forms.ModelForm):
    class Meta:
        model = PhieuChuyenKho
        fields = []

class ChiTietChuyenKhoForm(forms.ModelForm):
    san_pham = forms.ModelChoiceField(queryset=SanPham.objects.all(), required=True)

    class Meta:
        model = ChiTietChuyenKho
        fields = ['san_pham', 'so_luong', 'don_vi', 'kho_chuyen', 'kho_nhan']