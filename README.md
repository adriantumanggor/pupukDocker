# Virtual Enviroment bersama docker-compose
## Struktur Repositori

Repositori ini berisi direktori dan file berikut:

- **mysql/**: Berisi skrip untuk pengaturan database MySQL.
- **postgresql/**: Berisi skrip PostgreSQL untuk inisialisasi database.
- **pgadmin/**: File konfigurasi dan pengaturan untuk pgAdmin.
- **start.sh**: Skrip untuk mengelola izin SELinux agar Docker dapat mengakses file yang diperlukan.

## Tujuan

Tujuan utama dari repositori ini adalah untuk menciptakan pengalaman Docker yang mulus dalam mengelola database PostgreSQL dan MySQL menggunakan pgAdmin dan phpMyAdmin secara bergantian.

### Fitur

- **PostgreSQL dengan pgAdmin**: Mengelola database PostgreSQL dengan mudah melalui antarmuka web.
- **MySQL dengan phpMyAdmin**: Integrasi untuk pengelolaan database MySQL di masa mendatang.
- **Kesesuaian SELinux**: Memastikan bahwa kontainer Docker dapat mengakses direktori lokal dengan aman.

## Penggunaan

1. **Kloning Repositori**

   ```bash
   git clone https://github.com/username-anda/docker-compose-overpower.git
   cd docker-compose-overpower
   ```

2. **Jalankan Skrip Manajemen SELinux**

   Sebelum memulai kontainer, jalankan skrip `start.sh` untuk mengatur konteks SELinux yang benar:

   ```bash
   chmod +x start.sh
   ./start.sh
   ```

3. **Mulai Kontainer Docker**

   Gunakan Docker Compose untuk membangun dan menjalankan kontainer:

   ```bash
   docker-compose up --build
   ```

4. **Akses pgAdmin**

   - Buka peramban web Anda dan kunjungi `http://localhost:5050`.
   - Masukkan kredensial yang ditentukan di file Docker Compose Anda.

## Manajemen SELinux

Skrip `start.sh` mencakup perintah berikut untuk mengelola konteks SELinux:

```bash
sudo chcon -Rt svirt_sandbox_file_t ~/docker_compose
sudo semanage fcontext -a -t svirt_sandbox_file_t '/home/users/docker_compose(/.*)?'
sudo restorecon -Rv ~/docker_compose
```

Perintah ini memastikan bahwa Docker dapat mengakses direktori yang diperlukan dalam folder `docker_compose`.

## Kontribusi

Kontribusi sangat diterima! Jika Anda memiliki perbaikan atau ide, silakan fork repositori ini dan kirimkan pull request.

## Lisensi

Proyek ini dilisensikan di bawah Lisensi MIT - lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.

## Penghargaan

- [Docker](https://www.docker.com/) - untuk teknologi kontainerisasi.
- [pgAdmin](https://www.pgadmin.org/) - untuk menyediakan alat manajemen PostgreSQL yang kuat.
- [phpMyAdmin](https://www.phpmyadmin.net/) - untuk mengelola database MySQL melalui antarmuka web.

Selamat menggunakan Docker!
