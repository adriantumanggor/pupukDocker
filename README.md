# Virtual Enviroment bersama Dockerfile dan docker-compose

## Struktur Repositori

Repositori ini berisi direktori dan file berikut:

- **mysql/**: Berisi skrip PostgreSQL untuk inisialisasi database dan pengaturan database postgre MySQL.
- **postgresql/**: Berisi skrip PostgreSQL untuk inisialisasi database dan pengaturan database postgre.
- **pgadmin/**: File konfigurasi dan pengaturan untuk pgAdmin.
- **start.sh**: 
   You should execute the start.sh script in the following scenarios:
   
       After Creating a New Docker Compose Directory:
           If you create a new directory for your Docker Compose projects (e.g., ~/docker_compose), run this script to apply the proper SELinux contexts. This will ensure Docker has permission to access the files within the directory.
           Example:
   
           bash
   
           ./start.sh ~/docker_compose
   
       When You Encounter Permission Issues with SELinux:
           If Docker containers fail to access files or directories due to SELinux denying permission (e.g., files mounted as volumes in a container), running this script will apply the correct contexts and resolve the issues.
   
       After Moving or Copying Files to the Docker Directory:
           If you move files or directories into ~/docker_compose or copy files from another location, those files might have incorrect SELinux contexts. Running this script will ensure they get the correct context for Docker containers.
   
       After System Changes or SELinux Policy Updates:
           If you change the SELinux policy or update your system, SELinux may reset or change the contexts of some directories. Running the script after such changes will restore the correct context.
   
       On Initial Setup of Docker Projects on a New System:
           If you are setting up Docker for the first time on a system with SELinux (such as Fedora), this script helps ensure the necessary directories are properly configured for Docker access.
   
   You only need to run the script when:
   
       You create new directories for Docker Compose projects.
       You add or move files into the directory.
       You encounter permission issues related to SELinux.
   
   By running it at these points, you ensure that your Docker Compose environment works smoothly with SELinux enabled.

## Tujuan

Tujuan utama dari repositori ini adalah untuk menciptakan pengalaman Docker yang mulus dalam mengelola database PostgreSQL dan MySQL menggunakan pgAdmin dan phpMyAdmin secara bergantian.

### Fitur

- **PostgreSQL dengan pgAdmin**: Mengelola database PostgreSQL dengan mudah melalui antarmuka web.
- **MySQL dengan phpMyAdmin**: Integrasi untuk pengelolaan database MySQL di masa mendatang.
- **Kesesuaian SELinux**: Memastikan bahwa kontainer Docker dapat mengakses direktori lokal dengan aman.

