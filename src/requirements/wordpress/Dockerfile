# Dockerfile instructions to create a custom WordPress container with NGINX and PHP-FPM

FROM debian:11


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

RUN wget https://wordpress.org/latest.zip && \
  unzip latest.zip && \
  mv wordpress/* . && \
  rmdir wordpress && \
  rm latest.zip && \
  cp wp-config-sample.php wp-config.php

# cli 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
  chmod +x wp-cli.phar && \
  mv wp-cli.phar /usr/local/bin/wp

# Expose  port 80
EXPOSE 80

COPY init-wordpress.sh /init-wordpress.sh
RUN chmod +x /init-wordpress.sh
RUN apt-get update && apt-get install -y php-redis


# Command to run WordPress container with NGINX and PHP-FPM
CMD ["/init-wordpress.sh"]


