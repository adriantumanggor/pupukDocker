Here’s a `README.md` file that outlines the structure of your repository, the issues you encountered, and their solutions:

```markdown
# Docker Compose Setup

This repository contains a Docker Compose setup for managing MySQL, PostgreSQL, and pgAdmin services. The structure of the repository is as follows:

```

docker_compose/
├── mysql/
├── postgresql/
├── pgadmin/
└── start.sh

```

## Overview

This project aims to streamline the development process by containerizing MySQL, PostgreSQL, and pgAdmin using Docker. The `start.sh` script is included to manage SELinux settings for the Docker containers, ensuring they can access required files and directories.

## Issues Encountered

### 1. SELinux Permissions

While working with Docker on Fedora, SELinux can impose restrictions that prevent containers from accessing mounted directories. This can lead to errors like:

```

ls: cannot open directory '/docker-entrypoint-initdb.d/': Permission denied

```

#### Solution:
- Use `chcon` to change the SELinux context of the directory containing SQL scripts to `svirt_sandbox_file_t`.
- You can execute the following command:
  ```bash
  sudo chcon -Rt svirt_sandbox_file_t ~/docker_compose
  ```

- Alternatively, you can add `:z` or `:Z` at the end of the volume mount in the `docker-compose.yml` file for automatic context adjustment.

### 2. Docker Container Not Resolving Hostnames

During the installation of pgAdmin, the container may fail to resolve external repositories:

```
Could not resolve 'deb.pgadmin.org'
```

#### Solution

- Ensure Docker has proper DNS access. You can add a DNS server (like Google's Public DNS) in the `docker-compose.yml` file:

  ```yaml
  dns:
    - 8.8.8.8
  ```

- Alternatively, use a different installation method (e.g., install pgAdmin via `pip` instead of from the repository).

### 3. Using pgAdmin with Mounted SQL Scripts

Attempting to access SQL files in a mounted directory can lead to permission issues, as pgAdmin may not have access to the directory where the SQL files are stored.

#### Solution

- Make sure to set the appropriate SELinux contexts on the mounted directory.
- Use the correct volume configuration in the `docker-compose.yml` file:

  ```yaml
  volumes:
    - ../postgresql:/postgresql_scripts:z
  ```

## Start Script

The `start.sh` script is provided to manage SELinux configurations:

```bash
#!/bin/bash
# Script to set SELinux context and restore defaults
sudo semanage fcontext -a -t svirt_sandbox_file_t '/path/to/docker_compose(/.*)?'
sudo restorecon -R '/path/to/docker_compose'
```

## Usage

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd docker_compose
   ```

2. Run the `start.sh` script to set SELinux contexts:

   ```bash
   bash start.sh
   ```

3. Start the Docker containers:

   ```bash
   docker-compose up --build
   ```

## Conclusion

This setup provides a convenient way to manage MySQL, PostgreSQL, and pgAdmin using Docker while addressing common issues related to SELinux and container permissions. If you encounter any further issues, feel free to check the official documentation or seek help in the community.

```

Feel free to modify any parts to better fit your style or add additional information!
