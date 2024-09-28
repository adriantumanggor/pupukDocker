-- Membuat database
CREATE DATABASE belanja_online;

USE belanja_online;

-- Tabel Kategori Produk
CREATE TABLE kategori_produk (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL
);

-- Tabel Produk
CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    harga_produk DECIMAL(10, 2) NOT NULL,
    stok_produk INT NOT NULL,
    id_kategori INT,
    FOREIGN KEY (id_kategori) REFERENCES kategori_produk(id_kategori)
);

-- Tabel Promo
CREATE TABLE promo (
    id_promo INT AUTO_INCREMENT PRIMARY KEY,
    nama_promo VARCHAR(100) NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_akhir DATE NOT NULL,
    jenis_diskon ENUM('persentase', 'potongan') NOT NULL,
    nilai_diskon DECIMAL(10, 2) NOT NULL
);

-- Tabel Diskon
CREATE TABLE diskon (
    id_diskon INT AUTO_INCREMENT PRIMARY KEY,
    id_produk INT,
    id_promo INT,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY (id_promo) REFERENCES promo(id_promo)
);

-- Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email_pelanggan VARCHAR(100) NOT NULL UNIQUE
);

-- Tabel Pesanan
CREATE TABLE pesanan (
    id_pesanan INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    tanggal_pesanan DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Tabel Detail Pesanan
CREATE TABLE detail_pesanan (
    id_detail_pesanan INT AUTO_INCREMENT PRIMARY KEY,
    id_pesanan INT,
    id_produk INT,
    jumlah INT NOT NULL,
    harga DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);
