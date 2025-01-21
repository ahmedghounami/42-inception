
# base image: version 12 of debian
FROM    debian:bookworm

# Update package 
RUN apt update && apt upgrade

# install necessary packages (PHP and extensions)
RUN apt install -y php php-mysql wget

# install adminer
RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/index.php

# Start a PHP built-in server
# Adminer doesn’t need a full web server like NGINX or Apache. You can run it with PHP’s built-in server.
# -S: This option starts the built-in PHP web server.
# -t /var/www/html: This specifies the document root for the server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]