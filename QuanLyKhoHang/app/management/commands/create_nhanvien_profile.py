from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from app.models import NhanVien

class Command(BaseCommand):
    help = 'Tạo hồ sơ NhanVien cho tài khoản admin'

    def handle(self, *args, **kwargs):
        admin_user = User.objects.filter(is_superuser=True).first()
        if admin_user:
            nhan_vien, created = NhanVien.objects.get_or_create(nguoi_dung=admin_user)
            if created:
                self.stdout.write(self.style.SUCCESS(f'Tạo hồ sơ NhanVien cho admin: {admin_user.username}'))
            else:
                self.stdout.write(self.style.WARNING(f'Admin {admin_user.username} đã có hồ sơ NhanVien'))
        else:
            self.stdout.write(self.style.ERROR('Không tìm thấy tài khoản admin'))