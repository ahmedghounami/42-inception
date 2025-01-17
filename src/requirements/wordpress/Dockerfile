# Dockerfile instructions to create a custom WordPress container with NGINX and PHP-FPM

FROM debian:11

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install required PHP and NGINX dependencies
RUN apt-get update && \
  apt-get install -y \
  wget \
  php7.4-fpm \
  php7.4-mysql \
  curl \
  unzip \
  vim \
  nginx \
  && apt-get clean

# Set the working directory

WORKDIR /var/www/html
# https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# Install WordPress
RUN wget https://wordpress.org/latest.zip && \
  unzip latest.zip && \
  mv wordpress/* . && \
  rmdir wordpress && \
  rm latest.zip && \
  cp wp-config-sample.php wp-config.php

# Expose port 80
EXPOSE 80


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Command to run WordPress container with NGINX and PHP-FPM
CMD ["/entrypoint.sh"]





########                           docker run --rm -it \
#######                           --name wordpress-container \
#######                           --network wordpress-network \
#######                           -v wordpress_data:/var/www/html \
#######                           custom-wordpress
#######
##############











# Install necessary packages
# RUN apt-get update && apt-get install -y \
#     wget \
#     nginx \
#     mariadb-server \
#     php7.4-fpm \
#     php7.4-mysql \
#     curl \
#     unzip \
#     vim \
#     && apt-get clean

# # Set the working directory
# WORKDIR /var/www

# # Download and extract WordPress

# cd /var/www/html
# wget https://wordpress.org/latest.tar.gz
# tar -xzf latest.tar.gz --strip-components=1
# rm latest.tar.gz


# chown -R www-data:www-data /var/www/html
# chmod -R 755 /var/www/html

# service php7.4-fpm start
# cp wp-config-sample.php wp-config.php

# # Expose port 80 for NGINX
# EXPOSE 80
# CMD ["bash"]














# apt-get update
# apt-get install -y \
#     wget \
#      nginx \
#     php7.4-fpm \
#     php7.4-mysql \
#     curl \
#     unzip \
#     vim

# cd /var/www
# wget https://wordpress.org/latest.tar.gz
# tar -xvzf latest.tar.gz
# mv wordpress/* .
# rmdir wordpress
# rm latest.tar.gz


# {
# Create the WordPress NGINX Configuration: Create the file /etc/nginx/sites-available/wordpress:

# vim /etc/nginx/sites-available/wordpress

# server {
#     listen 80;
#     server_name localhost;

#     root /var/www;
#     index index.php index.html index.htm;

#     location / {
#         try_files $uri $uri/ /index.php?$args;
#     }

#     location ~ \.php$ {
#         include snippets/fastcgi-php.conf;
#         fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
#         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#         include fastcgi_params;
#     }

#     location ~ /\.ht {
#         deny all;
#     }
# }


# }

# ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/
# service mariadb start
# mysql_secure_installation
# mysql -u root

# CREATE DATABASE database_name;
# CREATE USER 'username'@'host' IDENTIFIED BY 'password';

