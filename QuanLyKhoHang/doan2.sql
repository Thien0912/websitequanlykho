CREATE DATABASE  IF NOT EXISTS `doan2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `doan2`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: doan2
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_chitietchuyenkho`
--

DROP TABLE IF EXISTS `app_chitietchuyenkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_chitietchuyenkho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `so_luong` int NOT NULL,
  `don_vi_id` bigint NOT NULL,
  `kho_nhan_id` bigint NOT NULL,
  `san_pham_id` bigint NOT NULL,
  `phieu_chuyen_kho_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_chitietchuyenkho_phieu_chuyen_kho_id_san__40aea4e7_uniq` (`phieu_chuyen_kho_id`,`san_pham_id`),
  KEY `app_chitietchuyenkho_don_vi_id_d494c7d3_fk_app_donvi_id` (`don_vi_id`),
  KEY `app_chitietchuyenkho_kho_nhan_id_98aa5074_fk_app_kho_id` (`kho_nhan_id`),
  KEY `app_chitietchuyenkho_san_pham_id_d4fd595b_fk_app_sanpham_id` (`san_pham_id`),
  CONSTRAINT `app_chitietchuyenkho_don_vi_id_d494c7d3_fk_app_donvi_id` FOREIGN KEY (`don_vi_id`) REFERENCES `app_donvi` (`id`),
  CONSTRAINT `app_chitietchuyenkho_kho_nhan_id_98aa5074_fk_app_kho_id` FOREIGN KEY (`kho_nhan_id`) REFERENCES `app_kho` (`id`),
  CONSTRAINT `app_chitietchuyenkho_phieu_chuyen_kho_id_42e3a230_fk_app_phieu` FOREIGN KEY (`phieu_chuyen_kho_id`) REFERENCES `app_phieuchuyenkho` (`id`),
  CONSTRAINT `app_chitietchuyenkho_san_pham_id_d4fd595b_fk_app_sanpham_id` FOREIGN KEY (`san_pham_id`) REFERENCES `app_sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_chitietchuyenkho`
--

LOCK TABLES `app_chitietchuyenkho` WRITE;
/*!40000 ALTER TABLE `app_chitietchuyenkho` DISABLE KEYS */;
INSERT INTO `app_chitietchuyenkho` VALUES (116,5,3,2,6,122),(117,5,2,2,8,122),(118,5,2,2,7,123),(120,10,2,2,7,128),(126,1,3,2,6,137),(127,1,3,2,6,138);
/*!40000 ALTER TABLE `app_chitietchuyenkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_chitietnhapkho`
--

DROP TABLE IF EXISTS `app_chitietnhapkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_chitietnhapkho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `so_luong` int NOT NULL,
  `tong_tien` int NOT NULL,
  `phieu_nhap_kho_id` bigint NOT NULL,
  `san_pham_id` bigint NOT NULL,
  `don_vi_id` bigint NOT NULL,
  `kho_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_chitietnhapkho_phieu_nhap_kho_id_san_pham_id_5bea47dd_uniq` (`phieu_nhap_kho_id`,`san_pham_id`),
  KEY `app_chitietnhapkho_san_pham_id_44ccd61d_fk_app_sanpham_id` (`san_pham_id`),
  KEY `app_chitietnhapkho_don_vi_id_fd006218_fk_app_donvi_id` (`don_vi_id`),
  KEY `app_chitietnhapkho_kho_id_09f705f5_fk_app_kho_id` (`kho_id`),
  CONSTRAINT `app_chitietnhapkho_don_vi_id_fd006218_fk_app_donvi_id` FOREIGN KEY (`don_vi_id`) REFERENCES `app_donvi` (`id`),
  CONSTRAINT `app_chitietnhapkho_kho_id_09f705f5_fk_app_kho_id` FOREIGN KEY (`kho_id`) REFERENCES `app_kho` (`id`),
  CONSTRAINT `app_chitietnhapkho_phieu_nhap_kho_id_53e28e96_fk_app_phieu` FOREIGN KEY (`phieu_nhap_kho_id`) REFERENCES `app_phieunhapkho` (`id`),
  CONSTRAINT `app_chitietnhapkho_san_pham_id_44ccd61d_fk_app_sanpham_id` FOREIGN KEY (`san_pham_id`) REFERENCES `app_sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_chitietnhapkho`
--

LOCK TABLES `app_chitietnhapkho` WRITE;
/*!40000 ALTER TABLE `app_chitietnhapkho` DISABLE KEYS */;
INSERT INTO `app_chitietnhapkho` VALUES (5,100,6700000,6,6,3,1),(6,100,64000000,7,8,3,1),(7,100,64000000,7,9,3,1),(8,100,59000000,8,10,3,1),(9,100,70000000,8,7,3,1);
/*!40000 ALTER TABLE `app_chitietnhapkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_chitietxuatkho`
--

DROP TABLE IF EXISTS `app_chitietxuatkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_chitietxuatkho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `so_luong` int NOT NULL,
  `gia` int NOT NULL,
  `phieu_xuat_kho_id` bigint NOT NULL,
  `san_pham_id` bigint NOT NULL,
  `don_vi_id` bigint NOT NULL,
  `kho_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_chitietxuatkho_phieu_xuat_kho_id_san_pham_id_a9e77e08_uniq` (`phieu_xuat_kho_id`,`san_pham_id`),
  KEY `app_chitietxuatkho_san_pham_id_9ccc7ad1_fk_app_sanpham_id` (`san_pham_id`),
  KEY `app_chitietxuatkho_don_vi_id_0a5a4b44_fk_app_donvi_id` (`don_vi_id`),
  KEY `app_chitietxuatkho_kho_id_51604bc1_fk_app_kho_id` (`kho_id`),
  CONSTRAINT `app_chitietxuatkho_don_vi_id_0a5a4b44_fk_app_donvi_id` FOREIGN KEY (`don_vi_id`) REFERENCES `app_donvi` (`id`),
  CONSTRAINT `app_chitietxuatkho_kho_id_51604bc1_fk_app_kho_id` FOREIGN KEY (`kho_id`) REFERENCES `app_kho` (`id`),
  CONSTRAINT `app_chitietxuatkho_phieu_xuat_kho_id_b38ef110_fk_app_phieu` FOREIGN KEY (`phieu_xuat_kho_id`) REFERENCES `app_phieuxuatkho` (`id`),
  CONSTRAINT `app_chitietxuatkho_san_pham_id_9ccc7ad1_fk_app_sanpham_id` FOREIGN KEY (`san_pham_id`) REFERENCES `app_sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_chitietxuatkho`
--

LOCK TABLES `app_chitietxuatkho` WRITE;
/*!40000 ALTER TABLE `app_chitietxuatkho` DISABLE KEYS */;
INSERT INTO `app_chitietxuatkho` VALUES (2,10,320000,2,8,2,1),(3,10,320000,2,9,3,1),(4,5,160000,3,9,2,1),(5,5,16750,3,6,2,1),(6,10,320000,3,8,2,1);
/*!40000 ALTER TABLE `app_chitietxuatkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_donvi`
--

DROP TABLE IF EXISTS `app_donvi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_donvi` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_don_vi` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_donvi`
--

LOCK TABLES `app_donvi` WRITE;
/*!40000 ALTER TABLE `app_donvi` DISABLE KEYS */;
INSERT INTO `app_donvi` VALUES (2,'Chai'),(3,'Thùng'),(4,'Lốc');
/*!40000 ALTER TABLE `app_donvi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_khachhang`
--

DROP TABLE IF EXISTS `app_khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_khachhang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  `dia_chi` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `dien_thoai` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_khachhang`
--

LOCK TABLES `app_khachhang` WRITE;
/*!40000 ALTER TABLE `app_khachhang` DISABLE KEYS */;
INSERT INTO `app_khachhang` VALUES (1,'Nguyễn Văn An','Cần Thơ','thienghast@gmail.com','0758414225'),(2,'Trần Anh','Cà Mau','anh@gmail.com','0794197233'),(3,'Lê Thị Hoa','Đồng Tháp','hoadongthap@gmail.com','0758414265');
/*!40000 ALTER TABLE `app_khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_kho`
--

DROP TABLE IF EXISTS `app_kho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_kho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_kho` varchar(100) NOT NULL,
  `dia_chi` varchar(255) NOT NULL,
  `nhan_vien_quan_ly_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_kho_nhan_vien_quan_ly_id_7af7ed6f_fk_app_nhanvien_id` (`nhan_vien_quan_ly_id`),
  CONSTRAINT `app_kho_nhan_vien_quan_ly_id_7af7ed6f_fk_app_nhanvien_id` FOREIGN KEY (`nhan_vien_quan_ly_id`) REFERENCES `app_nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_kho`
--

LOCK TABLES `app_kho` WRITE;
/*!40000 ALTER TABLE `app_kho` DISABLE KEYS */;
INSERT INTO `app_kho` VALUES (1,'Cloudy','Can Tho',1),(2,'Cloudy1','Can Tho',2);
/*!40000 ALTER TABLE `app_kho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_loaihang`
--

DROP TABLE IF EXISTS `app_loaihang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_loaihang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_loaihang`
--

LOCK TABLES `app_loaihang` WRITE;
/*!40000 ALTER TABLE `app_loaihang` DISABLE KEYS */;
INSERT INTO `app_loaihang` VALUES (1,'Cái'),(2,'Lốc 6 chai'),(3,'Lon'),(4,'Hộp'),(5,'Chai');
/*!40000 ALTER TABLE `app_loaihang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_nhacungcap`
--

DROP TABLE IF EXISTS `app_nhacungcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_nhacungcap` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `dia_chi` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `dien_thoai` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_nhacungcap`
--

LOCK TABLES `app_nhacungcap` WRITE;
/*!40000 ALTER TABLE `app_nhacungcap` DISABLE KEYS */;
INSERT INTO `app_nhacungcap` VALUES (2,'Công ty sữa HC','Việt Nam','hc@gmail.com','0758414265'),(3,'Công ty NBS','Việt Nam','nbs@gmail.com','0786838773'),(4,'Công ty sữa Ba Miền','Việt Nam','bamien@gmail.com','0794197233');
/*!40000 ALTER TABLE `app_nhacungcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_nhanvien`
--

DROP TABLE IF EXISTS `app_nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_nhanvien` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `nguoi_dung_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nguoi_dung_id` (`nguoi_dung_id`),
  CONSTRAINT `app_nhanvien_nguoi_dung_id_efc3ad92_fk_auth_user_id` FOREIGN KEY (`nguoi_dung_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_nhanvien`
--

LOCK TABLES `app_nhanvien` WRITE;
/*!40000 ALTER TABLE `app_nhanvien` DISABLE KEYS */;
INSERT INTO `app_nhanvien` VALUES (1,'2024-06-17 13:45:28.148956',1),(2,'2024-06-17 13:59:15.174086',2);
/*!40000 ALTER TABLE `app_nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_nhasanxuat`
--

DROP TABLE IF EXISTS `app_nhasanxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_nhasanxuat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `dia_chi` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `dien_thoai` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_nhasanxuat`
--

LOCK TABLES `app_nhasanxuat` WRITE;
/*!40000 ALTER TABLE `app_nhasanxuat` DISABLE KEYS */;
INSERT INTO `app_nhasanxuat` VALUES (2,'AFC-HD AMS Life Science','Mỹ','afc@gmail.com','0758414225'),(3,'Abbott','Hoa Kỳ','abboth@gmail.com','0758414265'),(4,'Nutricare Việt Nam','Việt Nam','nutricare@gmail.com','0758414225'),(5,'NATURE MADE','Hoa Kỳ','naturemade@gmail.com','0758414265');
/*!40000 ALTER TABLE `app_nhasanxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_phieuchuyenkho`
--

DROP TABLE IF EXISTS `app_phieuchuyenkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_phieuchuyenkho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `nhan_vien_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_phieuchuyenkho_nhan_vien_id_aea849fd_fk_app_nhanvien_id` (`nhan_vien_id`),
  CONSTRAINT `app_phieuchuyenkho_nhan_vien_id_aea849fd_fk_app_nhanvien_id` FOREIGN KEY (`nhan_vien_id`) REFERENCES `app_nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_phieuchuyenkho`
--

LOCK TABLES `app_phieuchuyenkho` WRITE;
/*!40000 ALTER TABLE `app_phieuchuyenkho` DISABLE KEYS */;
INSERT INTO `app_phieuchuyenkho` VALUES (122,'2024-06-17 22:53:03.306227',1),(123,'2024-06-17 23:04:02.423072',1),(128,'2024-06-18 00:28:02.734359',1),(137,'2024-06-18 02:18:02.778880',1),(138,'2024-06-18 02:18:45.111891',1);
/*!40000 ALTER TABLE `app_phieuchuyenkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_phieunhapkho`
--

DROP TABLE IF EXISTS `app_phieunhapkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_phieunhapkho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `nhan_vien_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_phieunhapkho_nhan_vien_id_5dc8ea46_fk_app_nhanvien_id` (`nhan_vien_id`),
  CONSTRAINT `app_phieunhapkho_nhan_vien_id_5dc8ea46_fk_app_nhanvien_id` FOREIGN KEY (`nhan_vien_id`) REFERENCES `app_nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_phieunhapkho`
--

LOCK TABLES `app_phieunhapkho` WRITE;
/*!40000 ALTER TABLE `app_phieunhapkho` DISABLE KEYS */;
INSERT INTO `app_phieunhapkho` VALUES (6,'2024-06-17 22:45:58.296878',1),(7,'2024-06-17 22:46:46.512306',1),(8,'2024-06-17 22:47:41.231120',1);
/*!40000 ALTER TABLE `app_phieunhapkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_phieuxuatkho`
--

DROP TABLE IF EXISTS `app_phieuxuatkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_phieuxuatkho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_tao` datetime(6) NOT NULL,
  `tong_tien` int NOT NULL,
  `khach_hang_id` bigint NOT NULL,
  `nhan_vien_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_phieuxuatkho_khach_hang_id_90cb88c4_fk_app_khachhang_id` (`khach_hang_id`),
  KEY `app_phieuxuatkho_nhan_vien_id_cd62a448_fk_app_nhanvien_id` (`nhan_vien_id`),
  CONSTRAINT `app_phieuxuatkho_khach_hang_id_90cb88c4_fk_app_khachhang_id` FOREIGN KEY (`khach_hang_id`) REFERENCES `app_khachhang` (`id`),
  CONSTRAINT `app_phieuxuatkho_nhan_vien_id_cd62a448_fk_app_nhanvien_id` FOREIGN KEY (`nhan_vien_id`) REFERENCES `app_nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_phieuxuatkho`
--

LOCK TABLES `app_phieuxuatkho` WRITE;
/*!40000 ALTER TABLE `app_phieuxuatkho` DISABLE KEYS */;
INSERT INTO `app_phieuxuatkho` VALUES (2,'2024-06-17 22:48:33.029590',0,1,1),(3,'2024-06-17 22:49:51.033631',0,1,1);
/*!40000 ALTER TABLE `app_phieuxuatkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_sanpham`
--

DROP TABLE IF EXISTS `app_sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_sanpham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) NOT NULL,
  `mo_ta` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `gia` int NOT NULL,
  `loai_hang_id` bigint NOT NULL,
  `nha_cung_cap_id` bigint NOT NULL,
  `nha_san_xuat_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_sanpham_loai_hang_id_fd8d7445_fk_app_loaihang_id` (`loai_hang_id`),
  KEY `app_sanpham_nha_cung_cap_id_a49bee7e_fk_app_nhacungcap_id` (`nha_cung_cap_id`),
  KEY `app_sanpham_nha_san_xuat_id_904bd20f_fk_app_nhasanxuat_id` (`nha_san_xuat_id`),
  CONSTRAINT `app_sanpham_loai_hang_id_fd8d7445_fk_app_loaihang_id` FOREIGN KEY (`loai_hang_id`) REFERENCES `app_loaihang` (`id`),
  CONSTRAINT `app_sanpham_nha_cung_cap_id_a49bee7e_fk_app_nhacungcap_id` FOREIGN KEY (`nha_cung_cap_id`) REFERENCES `app_nhacungcap` (`id`),
  CONSTRAINT `app_sanpham_nha_san_xuat_id_904bd20f_fk_app_nhasanxuat_id` FOREIGN KEY (`nha_san_xuat_id`) REFERENCES `app_nhasanxuat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_sanpham`
--

LOCK TABLES `app_sanpham` WRITE;
/*!40000 ALTER TABLE `app_sanpham` DISABLE KEYS */;
INSERT INTO `app_sanpham` VALUES (6,'Lốc 6 Chai Sữa Vital 1.5 kcal 200ml','Công dụng: là dòng sữa cao năng lượng phù hợp cho bệnh nhân mau hồi phục sức khỏe. Sữa dành cho người kém hấp thu dinh dưỡng, người bệnh cần phục hồi sức khỏe','Lốc_6_Chai_Sữa_Vital_1.5_kcal_200ml_Cao_Năng_Lượng_igsG7lv.png',67000,2,3,3),(7,'Sữa Leanpro Surefort Dinh Dưỡng Tim Mạch Và Não Bộ','Tác dụng: Bảo vệ tim mạch, hỗ trợ hoạt động trí não, nhanh lành vết thương, phục hồi sức khỏe mau chóng.','Sữa_Leanpro_Surefort_Dinh_Dưỡng_Tim_Mạch_Và_Não_Bộ_mkl0EK3.png',700000,3,2,4),(8,'Sữa Non DiaSure Dành Cho Người Tiểu Đường Tốt Nhất Hiện Nay 650G','Sữa Diasure được kết hợp từ thành phần chính là sữa non nhập khẩu 100% New zealand.','Sữa_Non_DiaSure_Dành_Cho_Người_Tiểu_Đường_Tốt_Nhất_Hiện_Nay_650G_ON2sK6f.png',640000,3,4,2),(9,'Sữa Pediasure Hộp Giấy Pha Sẵn 110ml','Hương Vani la thơm ngon béo ngậy giàu dinh dưỡng\r\nDinh dưỡng cho trẻ biếng ăn giúp tăng cân hiệu quả','Sữa_Pediasure_Hộp_Giấy_Pha_Sẵn_110ml_Siêu_Tiện_Lợi_Giá_Rẻ_Hơn_AhHqsG4.png',640000,4,3,3),(10,'Viên Uống Tăng Chiều Cao GH Creation EX Nhật Bản','Công dụng: Bổ sung Canxi và vitamin D, hỗ trợ phát triển xương, cao lớn vượt trội','Viên_Uống_Tăng_Chiều_Cao_GH_Creation_EX_Nhật_Bản_PbPMDkG.png',590000,5,4,4);
/*!40000 ALTER TABLE `app_sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_tonkho`
--

DROP TABLE IF EXISTS `app_tonkho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_tonkho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `so_luong` int NOT NULL,
  `kho_id` bigint NOT NULL,
  `san_pham_id` bigint NOT NULL,
  `don_vi_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_tonkho_kho_id_068c2c7c_fk_app_kho_id` (`kho_id`),
  KEY `app_tonkho_san_pham_id_b7cdc692_fk_app_sanpham_id` (`san_pham_id`),
  KEY `app_tonkho_don_vi_id_458dfd1d_fk_app_donvi_id` (`don_vi_id`),
  CONSTRAINT `app_tonkho_don_vi_id_458dfd1d_fk_app_donvi_id` FOREIGN KEY (`don_vi_id`) REFERENCES `app_donvi` (`id`),
  CONSTRAINT `app_tonkho_kho_id_068c2c7c_fk_app_kho_id` FOREIGN KEY (`kho_id`) REFERENCES `app_kho` (`id`),
  CONSTRAINT `app_tonkho_san_pham_id_b7cdc692_fk_app_sanpham_id` FOREIGN KEY (`san_pham_id`) REFERENCES `app_sanpham` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_tonkho`
--

LOCK TABLES `app_tonkho` WRITE;
/*!40000 ALTER TABLE `app_tonkho` DISABLE KEYS */;
INSERT INTO `app_tonkho` VALUES (4,904,1,6,2),(5,2375,1,7,2),(6,2375,1,8,2),(7,2155,1,9,2),(8,2400,1,10,2),(9,10002048,2,6,3),(10,5,2,8,2),(11,25,2,7,2);
/*!40000 ALTER TABLE `app_tonkho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add khach hang',7,'add_khachhang'),(26,'Can change khach hang',7,'change_khachhang'),(27,'Can delete khach hang',7,'delete_khachhang'),(28,'Can view khach hang',7,'view_khachhang'),(29,'Can add loai hang',8,'add_loaihang'),(30,'Can change loai hang',8,'change_loaihang'),(31,'Can delete loai hang',8,'delete_loaihang'),(32,'Can view loai hang',8,'view_loaihang'),(33,'Can add nha cung cap',9,'add_nhacungcap'),(34,'Can change nha cung cap',9,'change_nhacungcap'),(35,'Can delete nha cung cap',9,'delete_nhacungcap'),(36,'Can view nha cung cap',9,'view_nhacungcap'),(37,'Can add nha san xuat',10,'add_nhasanxuat'),(38,'Can change nha san xuat',10,'change_nhasanxuat'),(39,'Can delete nha san xuat',10,'delete_nhasanxuat'),(40,'Can view nha san xuat',10,'view_nhasanxuat'),(41,'Can add nhan vien',11,'add_nhanvien'),(42,'Can change nhan vien',11,'change_nhanvien'),(43,'Can delete nhan vien',11,'delete_nhanvien'),(44,'Can view nhan vien',11,'view_nhanvien'),(45,'Can add kho',12,'add_kho'),(46,'Can change kho',12,'change_kho'),(47,'Can delete kho',12,'delete_kho'),(48,'Can view kho',12,'view_kho'),(49,'Can add phieu nhap kho',13,'add_phieunhapkho'),(50,'Can change phieu nhap kho',13,'change_phieunhapkho'),(51,'Can delete phieu nhap kho',13,'delete_phieunhapkho'),(52,'Can view phieu nhap kho',13,'view_phieunhapkho'),(53,'Can add phieu xuat kho',14,'add_phieuxuatkho'),(54,'Can change phieu xuat kho',14,'change_phieuxuatkho'),(55,'Can delete phieu xuat kho',14,'delete_phieuxuatkho'),(56,'Can view phieu xuat kho',14,'view_phieuxuatkho'),(57,'Can add san pham',15,'add_sanpham'),(58,'Can change san pham',15,'change_sanpham'),(59,'Can delete san pham',15,'delete_sanpham'),(60,'Can view san pham',15,'view_sanpham'),(61,'Can add ton kho',16,'add_tonkho'),(62,'Can change ton kho',16,'change_tonkho'),(63,'Can delete ton kho',16,'delete_tonkho'),(64,'Can view ton kho',16,'view_tonkho'),(65,'Can add chi tiet xuat kho',17,'add_chitietxuatkho'),(66,'Can change chi tiet xuat kho',17,'change_chitietxuatkho'),(67,'Can delete chi tiet xuat kho',17,'delete_chitietxuatkho'),(68,'Can view chi tiet xuat kho',17,'view_chitietxuatkho'),(69,'Can add chi tiet nhap kho',18,'add_chitietnhapkho'),(70,'Can change chi tiet nhap kho',18,'change_chitietnhapkho'),(71,'Can delete chi tiet nhap kho',18,'delete_chitietnhapkho'),(72,'Can view chi tiet nhap kho',18,'view_chitietnhapkho'),(73,'Can add don vi',19,'add_donvi'),(74,'Can change don vi',19,'change_donvi'),(75,'Can delete don vi',19,'delete_donvi'),(76,'Can view don vi',19,'view_donvi'),(77,'Can add phieu chuyen kho',20,'add_phieuchuyenkho'),(78,'Can change phieu chuyen kho',20,'change_phieuchuyenkho'),(79,'Can delete phieu chuyen kho',20,'delete_phieuchuyenkho'),(80,'Can view phieu chuyen kho',20,'view_phieuchuyenkho'),(81,'Can add chi tiet chuyen kho',21,'add_chitietchuyenkho'),(82,'Can change chi tiet chuyen kho',21,'change_chitietchuyenkho'),(83,'Can delete chi tiet chuyen kho',21,'delete_chitietchuyenkho'),(84,'Can view chi tiet chuyen kho',21,'view_chitietchuyenkho');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$2GmyXh74edA96Hh5GtZbdB$kjHXlGKHtCfW0bgv2591BrxXmsTsjq97Jy9yEgmn69Q=','2024-06-17 23:57:55.631099',1,'ad','','','ad@gmail.com',1,1,'2024-06-17 13:45:17.882849'),(2,'pbkdf2_sha256$720000$agmqKCRzIY4gFlH7dNuDAJ$/JtjrAq8xU5rYPzQiSpU3Kaq9wcEMIgib9sBCI3J2sk=','2024-06-17 22:37:29.132847',0,'admin','','','thienghast@gmail.com',0,1,'2024-06-17 13:59:14.510962');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-17 13:59:52.418272','1','cái',1,'[{\"added\": {}}]',19,1),(2,'2024-06-17 14:00:04.536869','1','cái',3,'',19,1),(3,'2024-06-17 14:00:10.076726','2','Chai',1,'[{\"added\": {}}]',19,1),(4,'2024-06-17 14:00:15.550486','3','Thùng',1,'[{\"added\": {}}]',19,1),(5,'2024-06-17 14:00:22.892965','4','Lốc',1,'[{\"added\": {}}]',19,1),(6,'2024-06-17 14:00:35.217463','1','Cái',1,'[{\"added\": {}}]',8,1),(7,'2024-06-17 14:42:38.249068','5','Phiếu chuyển kho 5 - 2024-06-17 14:41:59.430746+00:00',3,'',20,1),(8,'2024-06-17 14:42:38.255043','4','Phiếu chuyển kho 4 - 2024-06-17 14:40:24.642840+00:00',3,'',20,1),(9,'2024-06-17 14:42:38.258088','3','Phiếu chuyển kho 3 - 2024-06-17 14:38:12.426433+00:00',3,'',20,1),(10,'2024-06-17 14:42:38.261483','2','Phiếu chuyển kho 2 - 2024-06-17 14:37:10.946251+00:00',3,'',20,1),(11,'2024-06-17 14:42:38.264349','1','Phiếu chuyển kho 1 - 2024-06-17 14:35:38.691480+00:00',3,'',20,1),(12,'2024-06-17 15:09:43.140443','11','Phiếu chuyển kho 11 - 2024-06-17 15:09:20.799519+00:00',3,'',20,1),(13,'2024-06-17 15:09:43.143967','10','Phiếu chuyển kho 10 - 2024-06-17 15:07:33.001032+00:00',3,'',20,1),(14,'2024-06-17 15:09:43.146721','9','Phiếu chuyển kho 9 - 2024-06-17 15:06:27.831375+00:00',3,'',20,1),(15,'2024-06-17 15:09:43.149260','8','Phiếu chuyển kho 8 - 2024-06-17 14:49:16.392822+00:00',3,'',20,1),(16,'2024-06-17 15:09:43.151933','7','Phiếu chuyển kho 7 - 2024-06-17 14:45:19.565417+00:00',3,'',20,1),(17,'2024-06-17 15:09:43.154112','6','Phiếu chuyển kho 6 - 2024-06-17 14:42:43.016961+00:00',3,'',20,1),(18,'2024-06-17 15:11:43.076492','12','Phiếu chuyển kho 12 - 2024-06-17 15:09:54.609418+00:00',3,'',20,1),(19,'2024-06-17 15:12:07.149593','1','a',2,'[{\"changed\": {\"fields\": [\"So luong\"]}}]',16,1),(20,'2024-06-17 15:12:24.662909','14','Phiếu chuyển kho 14 - 2024-06-17 15:12:09.964233+00:00',3,'',20,1),(21,'2024-06-17 15:12:24.668718','13','Phiếu chuyển kho 13 - 2024-06-17 15:11:50.494096+00:00',3,'',20,1),(22,'2024-06-17 15:12:55.933262','16','Phiếu chuyển kho 16 - 2024-06-17 15:12:44.049070+00:00',3,'',20,1),(23,'2024-06-17 15:12:55.938953','15','Phiếu chuyển kho 15 - 2024-06-17 15:12:35.482281+00:00',3,'',20,1),(24,'2024-06-17 15:13:09.440462','17','Phiếu chuyển kho 17 - 2024-06-17 15:12:58.722242+00:00',3,'',20,1),(25,'2024-06-17 15:18:42.828359','18','Phiếu chuyển kho 18 - 2024-06-17 15:15:09.049589+00:00',3,'',20,1),(26,'2024-06-17 15:20:33.603369','19','Phiếu chuyển kho 19 - 2024-06-17 15:18:57.648082+00:00',3,'',20,1),(27,'2024-06-17 15:22:40.735270','20','Phiếu chuyển kho 20 - 2024-06-17 15:20:41.414774+00:00',3,'',20,1),(28,'2024-06-17 15:33:58.784773','21','Phiếu chuyển kho 21 - 2024-06-17 15:22:49.461107+00:00',3,'',20,1),(29,'2024-06-17 15:41:48.354695','23','Phiếu chuyển kho 23 - 2024-06-17 15:41:13.714804+00:00',3,'',20,1),(30,'2024-06-17 15:41:48.359621','22','Phiếu chuyển kho 22 - 2024-06-17 15:38:37.690339+00:00',3,'',20,1),(31,'2024-06-17 15:42:53.501822','24','Phiếu chuyển kho 24 - 2024-06-17 15:42:44.272092+00:00',3,'',20,1),(32,'2024-06-17 15:43:06.671179','27','Phiếu chuyển kho 27 - 2024-06-17 15:43:01.933084+00:00',3,'',20,1),(33,'2024-06-17 15:43:06.675575','26','Phiếu chuyển kho 26 - 2024-06-17 15:42:58.272437+00:00',3,'',20,1),(34,'2024-06-17 15:43:06.677917','25','Phiếu chuyển kho 25 - 2024-06-17 15:42:55.805138+00:00',3,'',20,1),(35,'2024-06-17 15:48:58.761649','28','Phiếu chuyển kho 28 - 2024-06-17 15:43:29.724796+00:00',3,'',20,1),(36,'2024-06-17 15:56:43.249951','30','Phiếu chuyển kho 30 - 2024-06-17 15:56:19.520395+00:00',3,'',20,1),(37,'2024-06-17 15:56:43.255824','29','Phiếu chuyển kho 29 - 2024-06-17 15:49:02.662691+00:00',3,'',20,1),(38,'2024-06-17 16:03:49.099940','39','Phiếu chuyển kho 39 - 2024-06-17 16:03:36.885879+00:00',3,'',20,1),(39,'2024-06-17 16:03:49.105327','38','Phiếu chuyển kho 38 - 2024-06-17 16:03:36.731603+00:00',3,'',20,1),(40,'2024-06-17 16:03:49.108665','37','Phiếu chuyển kho 37 - 2024-06-17 16:03:36.611017+00:00',3,'',20,1),(41,'2024-06-17 16:03:49.111767','36','Phiếu chuyển kho 36 - 2024-06-17 16:03:36.464883+00:00',3,'',20,1),(42,'2024-06-17 16:03:49.114653','35','Phiếu chuyển kho 35 - 2024-06-17 16:03:36.298681+00:00',3,'',20,1),(43,'2024-06-17 16:03:49.117610','34','Phiếu chuyển kho 34 - 2024-06-17 16:03:36.000626+00:00',3,'',20,1),(44,'2024-06-17 16:03:49.120584','33','Phiếu chuyển kho 33 - 2024-06-17 16:03:35.688580+00:00',3,'',20,1),(45,'2024-06-17 16:03:49.123358','32','Phiếu chuyển kho 32 - 2024-06-17 16:03:34.961834+00:00',3,'',20,1),(46,'2024-06-17 16:03:49.126350','31','Phiếu chuyển kho 31 - 2024-06-17 15:57:46.928622+00:00',3,'',20,1),(47,'2024-06-17 16:12:49.703934','40','Phiếu chuyển kho 40 - 2024-06-17 16:12:38.329965+00:00',3,'',20,1),(48,'2024-06-17 16:15:43.881332','41','Phiếu chuyển kho 41 - 2024-06-17 16:15:37.744315+00:00',3,'',20,1),(49,'2024-06-17 16:19:36.615927','42','Phiếu chuyển kho 42 - 2024-06-17 16:19:27.348729+00:00',3,'',20,1),(50,'2024-06-17 16:21:42.151578','43','Phiếu chuyển kho 43 - 2024-06-17 16:21:42.150911+00:00',1,'[{\"added\": {}}]',20,1),(51,'2024-06-17 16:21:57.118507','37','Phiếu chuyển kho Phiếu chuyển kho 43 - 2024-06-17 16:21:42.150911+00:00',1,'[{\"added\": {}}]',21,1),(52,'2024-06-17 16:27:42.148234','44','Phiếu chuyển kho 44 - 2024-06-17 16:27:28.496402+00:00',3,'',20,1),(53,'2024-06-17 16:27:42.152867','43','Phiếu chuyển kho 43 - 2024-06-17 16:21:42.150911+00:00',3,'',20,1),(54,'2024-06-17 16:39:02.715775','49','Phiếu chuyển kho 49 - 2024-06-17 16:38:54.098820+00:00',3,'',20,1),(55,'2024-06-17 16:39:02.721538','48','Phiếu chuyển kho 48 - 2024-06-17 16:38:27.269549+00:00',3,'',20,1),(56,'2024-06-17 17:09:01.366890','51','Phiếu chuyển kho 51',3,'',20,1),(57,'2024-06-17 17:09:01.371555','50','Phiếu chuyển kho 50',3,'',20,1),(58,'2024-06-17 17:29:24.886478','93','Phiếu chuyển kho 93',3,'',20,1),(59,'2024-06-17 17:29:24.889730','92','Phiếu chuyển kho 92',3,'',20,1),(60,'2024-06-17 17:29:24.891825','91','Phiếu chuyển kho 91',3,'',20,1),(61,'2024-06-17 17:29:24.893750','90','Phiếu chuyển kho 90',3,'',20,1),(62,'2024-06-17 17:29:24.896930','89','Phiếu chuyển kho 89',3,'',20,1),(63,'2024-06-17 17:29:24.899432','88','Phiếu chuyển kho 88',3,'',20,1),(64,'2024-06-17 18:12:36.244742','101','Phiếu chuyển kho 101',3,'',20,1),(65,'2024-06-17 18:12:36.250021','100','Phiếu chuyển kho 100',3,'',20,1),(66,'2024-06-17 18:12:36.253587','99','Phiếu chuyển kho 99',3,'',20,1),(67,'2024-06-17 18:12:36.256001','98','Phiếu chuyển kho 98',3,'',20,1),(68,'2024-06-17 18:12:36.258082','97','Phiếu chuyển kho 97',3,'',20,1),(69,'2024-06-17 18:12:36.260339','96','Phiếu chuyển kho 96',3,'',20,1),(70,'2024-06-17 18:12:36.262571','95','Phiếu chuyển kho 95',3,'',20,1),(71,'2024-06-17 18:12:36.263857','94','Phiếu chuyển kho 94',3,'',20,1),(72,'2024-06-17 18:19:36.172062','105','Phiếu chuyển kho 105',3,'',20,1),(73,'2024-06-17 18:19:36.176042','104','Phiếu chuyển kho 104',3,'',20,1),(74,'2024-06-17 18:19:36.180234','103','Phiếu chuyển kho 103',3,'',20,1),(75,'2024-06-17 18:19:36.183086','102','Phiếu chuyển kho 102',3,'',20,1),(76,'2024-06-17 19:14:05.611693','118','Phiếu chuyển kho 118',3,'',20,1),(77,'2024-06-17 19:14:05.616593','117','Phiếu chuyển kho 117',3,'',20,1),(78,'2024-06-17 19:14:05.617973','116','Phiếu chuyển kho 116',3,'',20,1),(79,'2024-06-17 19:14:05.620980','115','Phiếu chuyển kho 115',3,'',20,1),(80,'2024-06-17 19:14:05.623178','114','Phiếu chuyển kho 114',3,'',20,1),(81,'2024-06-17 19:14:05.625833','113','Phiếu chuyển kho 113',3,'',20,1),(82,'2024-06-17 19:14:05.628309','112','Phiếu chuyển kho 112',3,'',20,1),(83,'2024-06-17 19:14:05.630148','111','Phiếu chuyển kho 111',3,'',20,1),(84,'2024-06-17 19:14:05.631981','110','Phiếu chuyển kho 110',3,'',20,1),(85,'2024-06-17 19:14:05.633233','109','Phiếu chuyển kho 109',3,'',20,1),(86,'2024-06-17 19:14:05.635576','108','Phiếu chuyển kho 108',3,'',20,1),(87,'2024-06-17 19:14:05.637581','107','Phiếu chuyển kho 107',3,'',20,1),(88,'2024-06-17 19:14:05.639518','106','Phiếu chuyển kho 106',3,'',20,1),(89,'2024-06-17 19:31:35.195375','120','Phiếu chuyển kho 120',3,'',20,1),(90,'2024-06-17 19:31:35.200928','119','Phiếu chuyển kho 119',3,'',20,1),(91,'2024-06-17 22:02:25.744604','2','Phiếu nhập kho 2',3,'',18,1),(92,'2024-06-17 22:02:25.751766','1','Phiếu nhập kho 1',3,'',18,1),(93,'2024-06-17 22:12:32.043725','2','Lốc',1,'[{\"added\": {}}]',8,1),(94,'2024-06-17 22:12:43.480805','2','Lốc 6 chai',2,'[{\"changed\": {\"fields\": [\"Ten\"]}}]',8,1),(95,'2024-06-17 22:21:05.618549','5','Lốc 6 Chai Sữa Vital 1.5 kcal 200ml',3,'',15,1),(96,'2024-06-17 22:21:05.624521','4','Lốc 6 Chai Sữa Vital 1.5 kcal 200ml',3,'',15,1),(97,'2024-06-17 22:21:05.626703','3','Lốc 6 Chai Sữa Vital 1.5 kcal 200ml',3,'',15,1),(98,'2024-06-17 22:28:06.263847','3','Lon',1,'[{\"added\": {}}]',8,1),(99,'2024-06-17 22:28:11.984684','4','Hộp',1,'[{\"added\": {}}]',8,1),(100,'2024-06-17 22:34:36.110709','5','Chai',1,'[{\"added\": {}}]',8,1),(101,'2024-06-17 22:35:13.109421','10','Viên Uống Tăng Chiều Cao GH Creation EX Nhật Bản',2,'[{\"changed\": {\"fields\": [\"Loai hang\"]}}]',15,1),(102,'2024-06-18 00:11:57.783802','5','DM',1,'[{\"added\": {}}]',12,1),(103,'2024-06-18 00:12:12.612681','5','DM',3,'',12,1),(104,'2024-06-18 00:25:58.191737','125','Phiếu chuyển kho 125',3,'',20,1),(105,'2024-06-18 00:27:50.278616','127','Phiếu chuyển kho 127',3,'',20,1),(106,'2024-06-18 00:27:50.284618','126','Phiếu chuyển kho 126',3,'',20,1),(107,'2024-06-18 00:30:44.639105','4','Lốc 6 Chai Sữa Vital 1.5 kcal 200ml',2,'[{\"changed\": {\"fields\": [\"So luong\"]}}]',16,1),(108,'2024-06-18 00:43:07.234474','9','Lốc 6 Chai Sữa Vital 1.5 kcal 200ml',2,'[{\"changed\": {\"fields\": [\"So luong\"]}}]',16,1),(109,'2024-06-18 00:46:34.099742','124','Phiếu chuyển kho Phiếu chuyển kho 132',3,'',21,1),(110,'2024-06-18 00:46:34.105982','123','Phiếu chuyển kho Phiếu chuyển kho 131',3,'',21,1),(111,'2024-06-18 00:46:34.108882','122','Phiếu chuyển kho Phiếu chuyển kho 130',3,'',21,1),(112,'2024-06-18 00:48:59.828301','4','Lốc 6 Chai Sữa Vital 1.5 kcal 200ml',2,'[{\"changed\": {\"fields\": [\"So luong\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(21,'app','chitietchuyenkho'),(18,'app','chitietnhapkho'),(17,'app','chitietxuatkho'),(19,'app','donvi'),(7,'app','khachhang'),(12,'app','kho'),(8,'app','loaihang'),(9,'app','nhacungcap'),(11,'app','nhanvien'),(10,'app','nhasanxuat'),(20,'app','phieuchuyenkho'),(13,'app','phieunhapkho'),(14,'app','phieuxuatkho'),(15,'app','sanpham'),(16,'app','tonkho'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-17 13:42:41.447298'),(2,'auth','0001_initial','2024-06-17 13:42:41.998524'),(3,'admin','0001_initial','2024-06-17 13:42:42.125216'),(4,'admin','0002_logentry_remove_auto_add','2024-06-17 13:42:42.125216'),(5,'admin','0003_logentry_add_action_flag_choices','2024-06-17 13:42:42.145618'),(6,'app','0001_initial','2024-06-17 13:42:43.045178'),(7,'app','0002_donvi_chitietnhapkho_don_vi_chitietxuatkho_don_vi_and_more','2024-06-17 13:42:43.254695'),(8,'app','0003_alter_chitietnhapkho_don_vi_and_more','2024-06-17 13:42:43.534943'),(9,'app','0004_remove_kho_nhan_vien_kho_dia_chi_and_more','2024-06-17 13:42:43.690498'),(10,'app','0005_alter_kho_dia_chi','2024-06-17 13:42:43.690498'),(11,'app','0006_alter_kho_nhan_vien_quan_ly','2024-06-17 13:42:43.827534'),(12,'app','0007_alter_kho_nhan_vien_quan_ly','2024-06-17 13:42:43.845472'),(13,'app','0008_chitietnhapkho_kho_alter_kho_nhan_vien_quan_ly','2024-06-17 13:42:43.951213'),(14,'app','0009_alter_chitietnhapkho_kho','2024-06-17 13:42:44.057207'),(15,'app','0010_chitietxuatkho_kho','2024-06-17 13:42:44.128351'),(16,'app','0011_alter_chitietxuatkho_kho','2024-06-17 13:42:44.224155'),(17,'app','0012_phieuchuyenkho_chitietchuyenkho','2024-06-17 13:42:44.578722'),(18,'app','0013_remove_phieuchuyenkho_tong_tien','2024-06-17 13:42:44.600958'),(19,'contenttypes','0002_remove_content_type_name','2024-06-17 13:42:44.695615'),(20,'auth','0002_alter_permission_name_max_length','2024-06-17 13:42:44.761738'),(21,'auth','0003_alter_user_email_max_length','2024-06-17 13:42:44.792855'),(22,'auth','0004_alter_user_username_opts','2024-06-17 13:42:44.803183'),(23,'auth','0005_alter_user_last_login_null','2024-06-17 13:42:44.862463'),(24,'auth','0006_require_contenttypes_0002','2024-06-17 13:42:44.862463'),(25,'auth','0007_alter_validators_add_error_messages','2024-06-17 13:42:44.881742'),(26,'auth','0008_alter_user_username_max_length','2024-06-17 13:42:44.945427'),(27,'auth','0009_alter_user_last_name_max_length','2024-06-17 13:42:45.027024'),(28,'auth','0010_alter_group_name_max_length','2024-06-17 13:42:45.052508'),(29,'auth','0011_update_proxy_permissions','2024-06-17 13:42:45.071453'),(30,'auth','0012_alter_user_first_name_max_length','2024-06-17 13:42:45.145462'),(31,'sessions','0001_initial','2024-06-17 13:42:45.178462'),(32,'app','0014_remove_phieuchuyenkho_kho_chuyen','2024-06-17 15:06:18.884368');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('jjchhfoa9x8q6dt1icahqc1cs9tbtwny','.eJxVjEEOwiAQRe_C2hCgIINL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERWpx-t4T04LaDfMd2myXNbV2mJHdFHrTLcc78vB7u30HFXr81Bj-g0hmSCeDYaiQbnA9cbMZkQDEg-KD9oDSTt-eCYCyRcwUVEYr3B9pdOAc:1sJMEV:j4AXHw1Wbg90p1Q8iyWWbxQw6wOcbwy72NfyvmovRdM','2024-07-01 23:57:55.631099');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'doan2'
--

--
-- Dumping routines for database 'doan2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 16:52:52
