#!/bin/bash
sleep 5
echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config.php



# service php7.4-fpm start

sleep 5

# init admin with wp-cli
if ! wp core is-installed --allow-root; then
wp core install --url="https://localhost:443" \
  --title="My WordPress Site" \
  --admin_user="super" \
  --admin_password="super123" \
  --admin_email="super@example.com" \
  --allow-root
fi

sleep 5

# # init user with wp-cli
if ! wp user get ahmed --allow-root > /tmp/file; then
wp user create ahmed ahmed@example.com \
--role=editor --user_pass="ahmed123" \
--display_name="ahmed" --allow-root
fi

mkdir -p /run/php


echo "wordpress is running successfully ..."

php-fpm7.4 -F