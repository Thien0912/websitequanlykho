from django.contrib import admin
from django.urls import path
from . import views
from django.contrib.auth import views as auth_views
from .views import *
urlpatterns = [
    path('admin/', admin.site.urls),
    path('home/', views.home, name='home'),
    path('', views.loginForm, name='login'),
    path('register/', views.register, name='register'),
    path('danh_sach_khach_hang/', views.danh_sach_khach_hang, name='danh_sach_khach_hang'),
    path('add_khach_hang/', views.add_khach_hang, name='add_khach_hang'),
    path('logout/', views.logoutPage, name="logout"),
    path('add_san_pham/', views.add_san_pham, name='add_san_pham'),
    path('danh_sach_san_pham/', views.danh_sach_san_pham, name='danh_sach_san_pham'),
    path('add_nha_cung_cap', views.add_nha_cung_cap, name='add_nha_cung_cap'),
    path('danh_sach_nha_cung_cap/', views.danh_sach_nha_cung_cap, name='danh_sach_nha_cung_cap'),
    path('add_nha_san_xuat', views.add_nha_san_xuat, name='add_nha_san_xuat'),
    path('danh_sach_nha_san_xuat/', views.danh_sach_nha_san_xuat, name='danh_sach_nha_san_xuat'),
    path('danh_sach_ton_kho/', views.danh_sach_ton_kho, name='danh_sach_ton_kho'),
    path('danh_sach_phieu_xuat/', views.danh_sach_phieu_xuat, name='danh_sach_phieu_xuat'),
    path('add_phieu_nhap/', views.add_phieu_nhap, name='add_phieu_nhap'),
    path('danh_sach_phieu_nhap/', views.danh_sach_phieu_nhap, name='danh_sach_phieu_nhap'),
    path('add_phieu_xuat', views.add_phieu_xuat, name='add_phieu_xuat'),
    path('add_phieu_chuyen_kho/', views.add_phieu_chuyen_kho, name='add_phieu_chuyen_kho'),
    path('danh_sach_phieu_chuyen/', views.danh_sach_phieu_chuyen, name='danh_sach_phieu_chuyen'),

    path('invoice/<int:invoice_id>/', views.phieu_xuat_detail, name='phieu_xuat_detail'),
    path('nhap/<int:nhap_id>/', views.phieu_nhap_detail, name='phieu_nhap_detail'),
    path('product/<int:product_id>/', views.san_pham_detail, name='san_pham_detail'),
    path('chuyen/<int:chuyen_id>/', views.phieu_chuyen_detail, name='phieu_chuyen_detail'),

    path('product/<int:product_id>/delete/', views.delete_product, name='del_san_pham'),
    path('customer/delete/<int:customer_id>/delete/', views.del_khach_hang, name='del_khach_hang'),
    path('supplier/<int:supplier_id>/delete/', views.delete_supplier, name='del_nha_cung_cap'),
    path('nsx/<int:nsx_id>/delete/', views.delete_nsx, name='del_nha_san_xuat'),
    path('nhap/<int:nhap_id>/delete/', views.delete_nhap_kho, name='delete_nhap_kho'),
    path('invoices/<int:invoice_id>/delete/', views.delete_invoice, name='del_phieu_xuat'),
    path('phieu_chuyen/<int:phieu_chuyen_id>/delete/', views.delete_phieu_chuyen, name='delete_phieu_chuyen'),

    path('edit_san_pham/<int:product_id>/', views.edit_san_pham, name='edit_san_pham'),
    path('edit_khach_hang/<int:customer_id>/', views.edit_khach_hang, name='edit_khach_hang'),
    path('edit_nha_cung_cap/<int:supplier_id>/', views.edit_nha_cung_cap, name='edit_nha_cung_cap'),
    path('edit_nha_san_xuat/<int:nsx_id>/', views.edit_nha_san_xuat, name='edit_nha_san_xuat'),
    path('edit_ton_kho/<int:ton_kho_id>/', edit_ton_kho, name='edit_ton_kho'),

    path('generated_cv/<int:pk>/', views.generatedCv, name='generated_cv'),
    path('generated_cv1/<int:pk>/', views.generatedCv1, name='generated_cv1'),
    path('generated_cv2/<int:pk>/', views.generatedCv2, name='generated_cv2'),
]
