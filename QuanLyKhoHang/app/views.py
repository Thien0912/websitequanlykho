from email.mime import application
import imp
from itertools import product
from logging import config
from multiprocessing import context
from urllib import response
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, authenticate
from .forms import *
from django.http import HttpResponse,JsonResponse
from .models import *
from django.contrib.auth.decorators import login_required
import json
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate,login,logout
from django.contrib import messages
from django.views.decorators.http import require_http_methods
from django.forms.models import inlineformset_factory
from django.db.models import F, ExpressionWrapper, FloatField, Sum
from datetime import datetime
from django.utils import timezone
from datetime import timedelta
from django.forms import formset_factory
from django.forms import modelformset_factory
import urllib, base64
import io
import matplotlib.pyplot as plt
from django.urls import reverse
from django.db.models import Q
import matplotlib
matplotlib.use('Agg')
from django.contrib.auth.decorators import user_passes_test
from io import BytesIO
from reportlab.pdfgen import canvas
from django.template.loader import render_to_string
from django.db import transaction
from django.contrib.admin.views.decorators import staff_member_required
import pdfkit

# Create your views here.

def loginForm(request):
    if request.method == "POST":
        username= request.POST.get('username')
        password= request.POST.get('password')
        user= authenticate(request,username= username, password= password)
        if user is not None:
            login(request,user)
            return redirect('home')
        else:
            messages.info(request,'Tài khoản hoặc mật khẩu không đúng')
    context= {}
    return render(request,'app/login.html',context)

def register(request):
    form= DangKyNhanVienForm()
    if request.method == "POST":
        form = DangKyNhanVienForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    context= {'form':form}
    return render(request,'app/register.html',context)

def add_khach_hang(request):
    if request.method == 'POST':
        form = ThongTinKhachHangForm(request.POST)
        if form.is_valid():
            customer = form.save(commit=False)
            customer.nhan_vien = request.user.nhan_vien_profile
            customer.save()
            return redirect('danh_sach_khach_hang')
    else:
        form = ThongTinKhachHangForm()
    return render(request, 'app/add_khach_hang.html', {'form': form})

def danh_sach_khach_hang(request):
    if request.user.is_authenticated:
        customers = KhachHang.objects.filter()
        search_query = request.GET.get('search')
        if search_query:
            customers = customers.filter(Q(ten__icontains=search_query) | Q(dia_chi__icontains=search_query) | Q(dien_thoai__icontains=search_query))
        return render(request, 'app/danh_sach_khach_hang.html', {'customers': customers})
    else:
        return redirect('login')
    
def edit_khach_hang(request, customer_id):
    customer = get_object_or_404(KhachHang, id=customer_id)
    if request.method == 'POST':
        form = ThongTinKhachHangForm(request.POST, instance=customer)
        if form.is_valid():
            form.save()
            return redirect('danh_sach_khach_hang')
    else:
        form = ThongTinKhachHangForm(instance=customer)
    return render(request, 'app/edit_khach_hang.html', {'form': form})

def logoutPage(request):
        logout(request)
        return redirect('login')

def add_san_pham(request):
    if request.method == 'POST':
        form = SanPhamForm(request.POST, request.FILES)
        if form.is_valid():
            product = form.save(commit=False)
            product.save()

            don_vi = form.cleaned_data['don_vi']
            
            all_khos = Kho.objects.all()

            with transaction.atomic():
                for kho in all_khos:
                    ton_kho, created = TonKho.objects.get_or_create(
                        san_pham=product,
                        kho=kho,
                        don_vi=don_vi,
                        defaults={'so_luong': 0}
                    )
                    
                    if not created:
                        ton_kho.so_luong = 0
                        ton_kho.save()

            return redirect('danh_sach_san_pham')
    else:
        form = SanPhamForm()

    return render(request, 'app/add_san_pham.html', {'form': form})

def san_pham_detail(request, product_id):
    product = get_object_or_404(SanPham, pk=product_id)
    ton_kho_list = TonKho.objects.filter(san_pham=product)
    total_quantity = sum(ton_kho.so_luong for ton_kho in ton_kho_list)
    
    return render(request, 'app/san_pham_detail.html', {'product': product, 'ton_kho_list': ton_kho_list, 'total_quantity': total_quantity})

def edit_san_pham(request, product_id):
    product = get_object_or_404(SanPham, id=product_id)
    if request.method == 'POST':
        form = SanPhamForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            form.save()
            return redirect('danh_sach_san_pham')
    else:
        form = SanPhamForm(instance=product)
    return render(request, 'app/edit_san_pham.html', {'form': form, 'product': product})

def danh_sach_san_pham(request):
    if request.user.is_authenticated:
        products = SanPham.objects.filter()
        search_query = request.GET.get('search')
        if search_query:
            products = products.filter(Q(ten__icontains=search_query))

        sort_by = request.GET.get('sort_by')
        if sort_by == 'gia_tang':
            products = products.order_by('gia')
        elif sort_by == 'gia_giam':
            products = products.order_by('-gia')

    else:
        return redirect('login')
    
    return render(request, 'app/danh_sach_san_pham.html', {'products': products})

def add_nha_cung_cap(request):
    if not request.user.is_authenticated:
        return redirect('login')

    if request.method == 'POST':
        form = NhaCungCapForm(request.POST)
        if form.is_valid():
            supplier = form.save(commit=False)
            supplier.nhan_vien = request.user.nhan_vien_profile
            supplier.save()
            return redirect('danh_sach_nha_cung_cap')
    else:
        form = NhaCungCapForm()

    return render(request, 'app/add_nha_cung_cap.html', {'form': form})

def add_nha_san_xuat(request):
    if not request.user.is_authenticated:
        return redirect('login')

    if request.method == 'POST':
        form = NhaSanXuatForm(request.POST)
        if form.is_valid():
            supplier = form.save(commit=False)
            supplier.nhan_vien = request.user.nhan_vien_profile
            supplier.save()
            return redirect('danh_sach_nha_san_xuat')
    else:
        form = NhaSanXuatForm()

    return render(request, 'app/add_nha_san_xuat.html', {'form': form})

def edit_nha_cung_cap(request, supplier_id):
    supplier = get_object_or_404(NhaCungCap, id=supplier_id)
    if request.method == 'POST':
        form = NhaCungCapForm(request.POST, instance=supplier)
        if form.is_valid():
            form.save()
            return redirect('danh_sach_nha_cung_cap')
    else:
        form = NhaCungCapForm(instance=supplier)
    return render(request, 'app/edit_nha_cung_cap.html', {'form': form})

def edit_nha_san_xuat(request, nsx_id):
    nsx = get_object_or_404(NhaSanXuat, id=nsx_id)
    if request.method == 'POST':
        form = NhaSanXuatForm(request.POST, instance=nsx)
        if form.is_valid():
            form.save()
            return redirect('danh_sach_nha_san_xuat')
    else:
        form = NhaSanXuatForm(instance=nsx)
    return render(request, 'app/edit_nha_san_xuat.html', {'form': form})

def danh_sach_nha_cung_cap(request):
    if request.user.is_authenticated:
        suppliers = NhaCungCap.objects.filter()
        search_query = request.GET.get('search')
        if search_query:
            suppliers = suppliers.filter(Q(ten__icontains=search_query) | Q(dia_chi__icontains=search_query) | Q(dien_thoai__icontains=search_query))

        return render(request, 'app/danh_sach_nha_cung_cap.html', {'suppliers': suppliers})
    else:
        return redirect('login')
    
def danh_sach_nha_san_xuat(request):
    if request.user.is_authenticated:
        nsx = NhaSanXuat.objects.filter()
        search_query = request.GET.get('search')
        if search_query:
            nsx = nsx.filter(Q(ten__icontains=search_query) | Q(dia_chi__icontains=search_query) | Q(dien_thoai__icontains=search_query))

        return render(request, 'app/danh_sach_nha_san_xuat.html', {'nsx': nsx})
    else:
        return redirect('login')

def delete_product(request, product_id):
    if request.method == 'POST':
        product = get_object_or_404(SanPham, id=product_id)
        product.delete()
    return redirect('danh_sach_san_pham')

def del_khach_hang(request, customer_id):
    customer = get_object_or_404(KhachHang, id=customer_id)
    if request.method == 'POST':
        customer.delete()
        return redirect('danh_sach_khach_hang')
    return render(request, 'app/del_khach_hang.html', {'customer': customer})

def delete_supplier(request, supplier_id):
    supplier = get_object_or_404(NhaCungCap, id=supplier_id)
    if request.method == 'POST':
        supplier.delete()
        return redirect('danh_sach_nha_cung_cap')
    return render(request, 'app/delete_supplier.html', {'supplier': supplier})

def delete_nsx(request, nsx_id):
    nsx = get_object_or_404(NhaSanXuat, id=nsx_id)
    if request.method == 'POST':
        nsx.delete()
        return redirect('danh_sach_nha_san_xuat')
    return render(request, 'app/delete_nsx.html', {'nsx': nsx})

def danh_sach_phieu_xuat(request):
    invoices = PhieuXuatKho.objects.all()

    for invoice in invoices:
        total_price = invoice.chi_tiet_xuat.aggregate(total=Sum('gia'))['total'] or 0
        invoice.total_price = total_price

    return render(request, 'app/danh_sach_phieu_xuat.html', {'invoices': invoices})

def add_phieu_xuat(request):
    num_forms = 1
    ChiTietXuatFormSet = inlineformset_factory(PhieuXuatKho, ChiTietXuatKho, form=ChiTietXuatForm, extra=num_forms, can_delete=False)

    if request.method == 'POST':
        if 'update-forms' in request.POST:
            num_forms = int(request.POST.get('num-forms', 1))
            ChiTietXuatFormSet = inlineformset_factory(PhieuXuatKho, ChiTietXuatKho, form=ChiTietXuatForm, extra=num_forms, can_delete=False)
            form = PhieuXuatForm()
            formset = ChiTietXuatFormSet(queryset=ChiTietXuatKho.objects.none())
        elif 'save-invoice' in request.POST:
            form = PhieuXuatForm(request.POST)
            formset = ChiTietXuatFormSet(request.POST)
            if form.is_valid() and formset.is_valid():
                selected_products = [form.cleaned_data['san_pham'] for form in formset if form.cleaned_data.get('san_pham')]
                if len(selected_products) != len(set(selected_products)):
                    messages.error(request, "Sản phẩm được chọn trên các form không được trùng lặp.")
                else:
                    invoice = form.save(commit=False)
                    invoice.nhan_vien = request.user.nhan_vien_profile
                    invoice.save()
                    formset.instance = invoice
                    formset.save()

                    for chi_tiet_form in formset:
                        chi_tiet_xuat = chi_tiet_form.save(commit=False)
                        chi_tiet_xuat.phieu_xuat_kho = invoice
                        chi_tiet_xuat.save()

                        # Kiểm tra xem nhân viên có phải là quản lý của kho không
                        if request.user.nhan_vien_profile != chi_tiet_xuat.kho.nhan_vien_quan_ly:
                            messages.error(request, "Bạn không có quyền nhập kho cho kho này.")
                            return redirect('add_phieu_xuat')

                        # Xử lý trừ tồn kho dựa trên đơn vị của sản phẩm
                        if chi_tiet_xuat.don_vi:
                            if chi_tiet_xuat.don_vi.ten_don_vi == 'Thùng':
                                so_luong_tru = 24
                            elif chi_tiet_xuat.don_vi.ten_don_vi == 'Lốc 6 chai':
                                so_luong_tru = 6
                            elif chi_tiet_xuat.don_vi.ten_don_vi == 'Lốc':
                                so_luong_tru = 4
                            else:
                                so_luong_tru = 1

                        ton_kho = TonKho.objects.get_or_create(san_pham=chi_tiet_xuat.san_pham, kho=chi_tiet_xuat.kho)[0]
                        ton_kho.so_luong -= chi_tiet_xuat.so_luong * so_luong_tru
                        ton_kho.save()

                    formset.save()

                    return redirect('danh_sach_phieu_xuat')
        else:
            form = PhieuXuatForm()
            formset = ChiTietXuatFormSet(queryset=ChiTietXuatKho.objects.none())
    else:
        form = PhieuXuatForm()
        formset = ChiTietXuatFormSet(queryset=ChiTietXuatKho.objects.none())

    return render(request, 'app/add_phieu_xuat.html', {'form': form, 'formset': formset, 'num_forms': num_forms, 'messages': messages.get_messages(request)})

def phieu_xuat_detail(request, invoice_id):
    invoice = get_object_or_404(PhieuXuatKho, pk=invoice_id)
    chi_tiet_xuat = invoice.chi_tiet_xuat.all()
    total_price = sum(chi_tiet.gia for chi_tiet in invoice.chi_tiet_xuat.all())
    if request.method == 'POST':
        if 'delete-invoice' in request.POST:
            return delete_invoice(request, invoice_id)
        elif 'save-invoice' in request.POST:
            invoice.save()
            return redirect(reverse('phieu_xuat_detail', args=[invoice_id]))

    return render(request, 'app/phieu_xuat_detail.html', {'invoice': invoice, 'chi_tiet_xuat': chi_tiet_xuat, 'total_price': total_price})

def delete_invoice(request, invoice_id):
    invoice = get_object_or_404(PhieuXuatKho, id=invoice_id)
    invoice.delete()

    return redirect('danh_sach_phieu_xuat')

def edit_ton_kho(request, ton_kho_id):
    if request.user.is_authenticated:
        
        ton_kho = get_object_or_404(TonKho, id=ton_kho_id)
        
        if request.method == 'POST':
            form = TonKhoForm(request.POST, instance=ton_kho)
            if form.is_valid():
                form.save()
                return redirect('danh_sach_ton_kho')
        
        else:
            form = TonKhoForm(instance=ton_kho)
        
        return render(request, 'app/edit_ton_kho.html', {'form': form})
    
    else:
        return redirect('login')

def danh_sach_ton_kho(request):
    if request.user.is_authenticated:
        
        
        tonkho = TonKho.objects.filter(so_luong__gt=0)

        sort_by = request.GET.get('sort_by')
        if sort_by == 'so_luong_tang':
            tonkho = tonkho.order_by('so_luong')
        elif sort_by == 'so_luong_giam':
            tonkho = tonkho.order_by('-so_luong')
        
        search_query = request.GET.get('search')
        if search_query:
            tonkho = tonkho.filter(Q(san_pham__ten__icontains=search_query))
        
        return render(request, 'app/danh_sach_ton_kho.html', {'tonkho': tonkho})
    else:
        return redirect('login')
    
@login_required
def add_phieu_nhap(request):
    num_forms = 1
    ChiTietNhapFormSet = inlineformset_factory(
        PhieuNhapKho, ChiTietNhapKho, form=ChiTietNhapForm, extra=num_forms, can_delete=False
    )

    if request.method == 'POST':
        if 'update-forms' in request.POST:
            num_forms = int(request.POST.get('num-forms', 1))
            ChiTietNhapFormSet = inlineformset_factory(
                PhieuNhapKho, ChiTietNhapKho, form=ChiTietNhapForm, extra=num_forms, can_delete=False
            )
            form = PhieuNhapForm()
            formset = ChiTietNhapFormSet(queryset=ChiTietNhapKho.objects.none())
        elif 'save-invoice' in request.POST:
            form = PhieuNhapForm(request.POST)
            formset = ChiTietNhapFormSet(request.POST)
            if form.is_valid() and formset.is_valid():
                selected_products = [form.cleaned_data['san_pham'] for form in formset if form.cleaned_data.get('san_pham')]
                if len(selected_products) != len(set(selected_products)):
                    messages.error(request, "Sản phẩm được chọn trên các form không được trùng lặp.")
                else:
                    invoice = form.save(commit=False)
                    invoice.nhan_vien = request.user.nhan_vien_profile
                    invoice.save()
                    formset.instance = invoice
                    formset.save()

                    for chi_tiet_form in formset:
                        chi_tiet_nhap = chi_tiet_form.save(commit=False)
                        chi_tiet_nhap.phieu_nhap_kho = invoice  # Gán phieu_nhap_kho cho mỗi chi tiết nhập
                        chi_tiet_nhap.save()

                        if chi_tiet_nhap.don_vi:
                            if chi_tiet_nhap.don_vi.ten_don_vi == 'Thùng':
                                so_luong_tru = 24
                            elif chi_tiet_nhap.don_vi.ten_don_vi == 'Lốc 6 chai':
                                so_luong_tru = 6
                            elif chi_tiet_nhap.don_vi.ten_don_vi == 'Lốc':
                                so_luong_tru = 4
                            else:
                                so_luong_tru = 1

                        ton_kho = TonKho.objects.get_or_create(san_pham=chi_tiet_nhap.san_pham, kho=chi_tiet_nhap.kho)[0]
                        ton_kho.so_luong += chi_tiet_nhap.so_luong * so_luong_tru
                        ton_kho.save()

                    formset.save()

                    return redirect('danh_sach_phieu_nhap')
        else:
            form = PhieuNhapForm()
            formset = ChiTietNhapFormSet(queryset=ChiTietNhapKho.objects.none())
            
    else:
        form = PhieuNhapForm()
        formset = ChiTietNhapFormSet(queryset=ChiTietNhapKho.objects.none())

    return render(request, 'app/add_phieu_nhap.html', {'form': form, 'formset': formset, 'num_forms': num_forms})

def danh_sach_phieu_nhap(request):
    invoices = PhieuNhapKho.objects.all()

    for invoice in invoices:
        total_price = invoice.chi_tiet_nhap.aggregate(total=Sum('tong_tien'))['total'] or 0
        invoice.total_price = total_price

    return render(request, 'app/danh_sach_phieu_nhap.html', {'invoices': invoices})

def delete_nhap_kho(request, nhap_id):
    nhap = get_object_or_404(PhieuNhapKho, id=nhap_id)
    nhap.delete()

    return redirect('danh_sach_phieu_nhap')

def phieu_nhap_detail(request, nhap_id):
    
    nhap = get_object_or_404(PhieuNhapKho, pk=nhap_id)
    chi_tiet_nhap = nhap.chi_tiet_nhap.all()
    total_price = sum(chi_tiet.tong_tien for chi_tiet in nhap.chi_tiet_nhap.all())

    return render(request, 'app/phieu_nhap_detail.html', {'nhap': nhap, 'chi_tiet_nhap': chi_tiet_nhap, 'total_price':total_price})

def add_phieu_chuyen_kho(request):
    num_forms = 1
    ChiTietChuyenKhoFormSet = inlineformset_factory(
        PhieuChuyenKho,
        ChiTietChuyenKho,
        form=ChiTietChuyenKhoForm,
        extra=num_forms,
        can_delete=False,
    )

    if request.method == 'POST':
        if 'update-forms' in request.POST:
            num_forms = int(request.POST.get('num-forms', 1))
            ChiTietChuyenKhoFormSet = inlineformset_factory(
                PhieuChuyenKho,
                ChiTietChuyenKho,
                form=ChiTietChuyenKhoForm,
                extra=num_forms,
                can_delete=False,
            )
            form = PhieuChuyenKhoForm()
            formset = ChiTietChuyenKhoFormSet(queryset=ChiTietChuyenKho.objects.none())
        elif 'save-invoice' in request.POST:
            form = PhieuChuyenKhoForm(request.POST)
            formset = ChiTietChuyenKhoFormSet(request.POST)
            if form.is_valid() and formset.is_valid():
                selected_products = [form.cleaned_data['san_pham'] for form in formset if form.cleaned_data.get('san_pham')]
                if len(selected_products) != len(set(selected_products)):
                    messages.error(request, "Sản phẩm được chọn trên các form không được trùng lặp.")
                else:
                    
                        try:
                            phieu_chuyen_kho = form.save(commit=False)  # Lưu tạm PhieuChuyenKho nhưng chưa lưu vào DB
                            phieu_chuyen_kho.nhan_vien = request.user.nhan_vien_profile  # Gán giá trị cho nhan_vien
                            phieu_chuyen_kho.save()  # Bây giờ lưu vào DB

                            for chi_tiet_form in formset:
                                chi_tiet = chi_tiet_form.save(commit=False)
                                ton_kho_gui_di = TonKho.objects.get(kho=chi_tiet.kho_chuyen, san_pham=chi_tiet.san_pham)

                                # Tính toán số lượng chuyển dựa trên đơn vị
                                if chi_tiet.don_vi.ten_don_vi == 'Thùng':
                                    so_luong_chuyen = chi_tiet.so_luong * 24
                                elif chi_tiet.don_vi.ten_don_vi == 'Lốc 6 chai':
                                    so_luong_chuyen = chi_tiet.so_luong * 6
                                elif chi_tiet.don_vi.ten_don_vi == 'Lốc':
                                    so_luong_chuyen = chi_tiet.so_luong * 4
                                else :
                                    so_luong_chuyen = chi_tiet.so_luong

                                if so_luong_chuyen <= 0:
                                    raise ValidationError("Số lượng chuyển phải lớn hơn 0.")
                                elif so_luong_chuyen > ton_kho_gui_di.so_luong:
                                    raise ValidationError("Số lượng chuyển không được lớn hơn số lượng tồn kho.")
                                
                                ton_kho_gui_di.so_luong -= so_luong_chuyen
                                ton_kho_gui_di.save()

                                chi_tiet.phieu_chuyen_kho = phieu_chuyen_kho  # Gán PhieuChuyenKho đã lưu vào chi_tiet
                                chi_tiet.save()

                                try:
                                    ton_kho_nhan = TonKho.objects.get(kho=chi_tiet.kho_nhan, san_pham=chi_tiet.san_pham)
                                    ton_kho_nhan.so_luong += so_luong_chuyen
                                    ton_kho_nhan.save()
                                except TonKho.DoesNotExist:
                                    TonKho.objects.create(
                                        kho=chi_tiet.kho_nhan,
                                        san_pham=chi_tiet.san_pham,
                                        so_luong=so_luong_chuyen,
                                        don_vi=chi_tiet.don_vi
                                    )
                        except TonKho.DoesNotExist:
                            messages.error(request, "Không tồn tại tồn kho cho sản phẩm này trong kho gửi đi.")
                            return render(request, 'app/add_phieu_chuyen_kho.html', {'form': form, 'formset': formset, 'num_forms': num_forms})
                        
                        return redirect('danh_sach_phieu_chuyen')
        else:
            form = PhieuChuyenKhoForm()
            formset = ChiTietChuyenKhoFormSet(queryset=ChiTietChuyenKho.objects.none())
    else:
        form = PhieuChuyenKhoForm()
        formset = ChiTietChuyenKhoFormSet(queryset=ChiTietChuyenKho.objects.none())

    return render(request, 'app/add_phieu_chuyen_kho.html', {'form': form, 'formset': formset, 'num_forms': num_forms, 'messages': messages.get_messages(request)})

def danh_sach_phieu_chuyen(request):
    invoices = PhieuChuyenKho.objects.all()

    return render(request, 'app/danh_sach_phieu_chuyen.html', {'invoices': invoices})

def delete_phieu_chuyen(request, phieu_chuyen_id):
    phieu_chuyen = get_object_or_404(PhieuChuyenKho, id=phieu_chuyen_id)
    phieu_chuyen.delete()

    return redirect('danh_sach_phieu_chuyen')

def phieu_chuyen_detail(request, chuyen_id):
    
    chuyen = get_object_or_404(PhieuChuyenKho, pk=chuyen_id)
    chi_tiet_chuyen = chuyen.chi_tiet_chuyen.all()

    return render(request, 'app/phieu_chuyen_detail.html', {'nhap': chuyen, 'chi_tiet_chuyen': chi_tiet_chuyen})



config = pdfkit.configuration(wkhtmltopdf=r'C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe')

def generatedCv(request, pk):
    pdf = pdfkit.from_url(request.build_absolute_uri(reverse('generated_cv', args=[pk])), False, configuration=config)
    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="file_name.pdf"'
    return response

def generatedCv1(request, pk):
    pdf = pdfkit.from_url(request.build_absolute_uri(reverse('generated_cv1', args=[pk])), False, configuration=config)
    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="file_name.pdf"'
    return response

def generatedCv2(request, pk):
    pdf = pdfkit.from_url(request.build_absolute_uri(reverse('generated_cv2', args=[pk])), False, configuration=config)
    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="file_name.pdf"'
    return response

@staff_member_required
def home(request):
    now = datetime.now()
    current_year = now.year
    current_month = now.month
    data = {
        'labels': [],
        'nhap': [],
        'xuat': [],
    }
    # Tính toán doanh thu
    phieu_xuat = PhieuXuatKho.objects.aggregate(total_xuat=Sum('tong_tien'))['total_xuat'] or 0
    phieu_nhap = PhieuNhapKho.objects.aggregate(total_nhap=Sum('chi_tiet_nhap__tong_tien'))['total_nhap'] or 0
    doanh_thu = phieu_xuat - phieu_nhap

    for month in range(1, 13):
        data['labels'].append(f"Tháng {month}")
        nhap_amount = PhieuNhapKho.objects.filter(ngay_tao__year=current_year, ngay_tao__month=month).aggregate(total_nhap=Sum('chi_tiet_nhap__so_luong'))['total_nhap'] or 0
        xuat_amount = PhieuXuatKho.objects.filter(ngay_tao__year=current_year, ngay_tao__month=month).aggregate(total_xuat=Sum('chi_tiet_xuat__so_luong'))['total_xuat'] or 0
        data['nhap'].append(nhap_amount)
        data['xuat'].append(xuat_amount)

    fig, ax = plt.subplots(figsize=(10, 6))
    ax.plot(data['labels'], data['nhap'], marker='o', linestyle='-', color='b', label='Nhập')
    ax.plot(data['labels'], data['xuat'], marker='o', linestyle='-', color='r', label='Xuất')
    ax.set_xlabel('Tháng')
    ax.set_ylabel('Số lượng')
    ax.set_title('Biểu đồ Nhập/Xuất theo Tháng')
    ax.legend()

    buffer = io.BytesIO()
    plt.savefig(buffer, format='png')
    buffer.seek(0)
    chart = base64.b64encode(buffer.getvalue()).decode('utf-8')
    plt.close()

    context = {
        'chart': chart,
        'doanh_thu': doanh_thu,
    }

    return render(request, 'app/home.html', context)