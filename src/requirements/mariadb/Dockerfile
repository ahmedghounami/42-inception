# Use Debian 11 as the base image
FROM debian:11

# Set environment variables to prevent prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install MariaDB server and client
RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    mariadb-client \
    && apt-get clean

# Copy the MariaDB script to initialize the database
COPY init-mariadb.sh /var/run/init-mariadb.sh

RUN chmod +x /var/run/init-mariadb.sh

# Expose MariaDB port (default: 3306)
EXPOSE 3306



# Start MariaDB server on container startup

CMD ["/var/run/init-mariadb.sh"]
