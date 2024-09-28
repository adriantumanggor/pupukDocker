# Use Debian as the base image
FROM debian:bullseye-slim

# Install required dependencies
RUN apt-get update && \
    apt-get install -y curl ca-certificates gnupg lsb-release apt-transport-https python3 python3-pip python3-dev

# Add the pgAdmin public key and repository to Debian sources
RUN curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | apt-key add - && \
    sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'

# Install pgAdmin 4 in web mode
RUN apt-get update && apt-get install -y pgadmin4-web

# Create necessary directories and configure pgAdmin
RUN mkdir -p /var/lib/pgadmin /var/log/pgadmin /etc/pgadmin4 && \
    echo "SERVER_MODE = True" > /etc/pgadmin4/config_local.py && \
    echo "DEFAULT_SERVER = '0.0.0.0'" >> /etc/pgadmin4/config_local.py && \
    echo "PGADMIN_DEFAULT_EMAIL = 'admin@example.com'" >> /etc/pgadmin4/config_local.py && \
    echo "PGADMIN_DEFAULT_PASSWORD = 'admin'" >> /etc/pgadmin4/config_local.py

# Expose the default pgAdmin port
EXPOSE 80

# Start pgAdmin
CMD ["/usr/pgadmin4/bin/setup-web.sh", "--yes"]
