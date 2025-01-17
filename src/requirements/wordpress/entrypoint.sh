#!/bin/bash
sleep 5
echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config.php

echo $WORDPRESS_DB_NAME
echo $WORDPRESS_DB_USER
echo $WORDPRESS_DB_PASSWORD
echo $WORDPRESS_DB_HOST

# Start PHP-FPM and NGINX
service php7.4-fpm start
# service nginx start
# Keep the container running
tail -f /dev/null
