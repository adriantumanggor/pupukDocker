# Virtual Enviroment bersama docker-compose

## Struktur Repositori

Repositori ini berisi direktori dan file berikut:

- **mysql/**: Berisi skrip PostgreSQL untuk inisialisasi database dan pengaturan database postgre MySQL.
- **postgresql/**: Berisi skrip PostgreSQL untuk inisialisasi database dan pengaturan database postgre.
- **pgadmin/**: File konfigurasi dan pengaturan untuk pgAdmin.
- **start.sh**: Skrip untuk mengelola izin SELinux agar Docker dapat mengakses file yang diperlukan.

## Tujuan

Tujuan utama dari repositori ini adalah untuk menciptakan pengalaman Docker yang mulus dalam mengelola database PostgreSQL dan MySQL menggunakan pgAdmin dan phpMyAdmin secara bergantian.

### Fitur

- **PostgreSQL dengan pgAdmin**: Mengelola database PostgreSQL dengan mudah melalui antarmuka web.
- **MySQL dengan phpMyAdmin**: Integrasi untuk pengelolaan database MySQL di masa mendatang.
- **Kesesuaian SELinux**: Memastikan bahwa kontainer Docker dapat mengakses direktori lokal dengan aman.
