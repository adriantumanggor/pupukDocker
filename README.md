# Virtual Environment with Dockerfile and docker-compose

# Repository Structure

This repository contains the following directories and files:

- `mysql/`: MySQL scripts for initializing and setting up the MySQL database.
- `postgresql/`: PostgreSQL scripts for initializing and setting up the PostgreSQL database.
- `pgadmin/`: Configuration and setup files for pgAdmin.
- `start.sh`: A script to execute in specific scenarios (see below).

## When to Run `start.sh`

Run the `start.sh` script in the following scenarios:

### After Creating a New Docker Compose Directory

Run `start.sh` to apply the proper SELinux contexts, ensuring Docker has permission to access files within the directory.
- Example: `bash ./start.sh ~/docker_compose`

### When Encountering Permission Issues with SELinux

Run `start.sh` to resolve permission issues due to SELinux denying access to files or directories.

### After Moving or Copying Files to the Docker Directory

Run `start.sh` to ensure files have the correct SELinux contexts for Docker containers.

### After System Changes or SELinux Policy Updates

Run `start.sh` to restore the correct SELinux contexts after system changes or policy updates.

### On Initial Setup of Docker Projects on a New System

Run `start.sh` to ensure necessary directories are properly configured for Docker access on a new system with SELinux.

**Note:** You only need to run the script when:
- Creating new directories for Docker Compose projects.
- Adding or moving files into the directory.
- Encountering permission issues related to SELinux.

## Goals

The primary goal of this repository is to provide a seamless Docker experience for managing PostgreSQL and MySQL databases using pgAdmin and phpMyAdmin, respectively.

## Features

- **PostgreSQL with pgAdmin:** Easily manage PostgreSQL databases through a web interface.
- **MySQL with phpMyAdmin:** Integration for managing MySQL databases in the future.
- **SELinux Compatibility:** Ensure Docker containers can access local directories securely.
