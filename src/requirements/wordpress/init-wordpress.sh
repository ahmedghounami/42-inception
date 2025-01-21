#!/bin/bash
sleep 5
echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config.php

sleep 5

wp config set WP_REDIS_HOST 'redis' --allow-root

wp config set WP_CACHE 'true' --allow-root

wp config set FS_METHOD 'direct' --allow-root

wp config set WP_REDIS_PORT '6379' --allow-root

sleep 5

wp plugin install redis-cache --activate --allow-root

sleep 10

wp redis enable --allow-root

sleep 5

# wp cache flush --allow-root


# init admin with wp-cli
if ! wp core is-installed --allow-root >> /tmp/test; then
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

chmod -R 777 /var/www/html/
mkdir -p /run/php


echo "wordpress is running successfully ..."

php-fpm7.4 -F