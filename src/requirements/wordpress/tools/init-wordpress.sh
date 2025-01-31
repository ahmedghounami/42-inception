#!/bin/bash
sleep 15

echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf


wp config set DB_NAME "$WORDPRESS_DB_NAME" --allow-root
wp config set DB_USER "$WORDPRESS_DB_USER" --allow-root
wp config set DB_PASSWORD "$WORDPRESS_DB_PASSWORD" --allow-root
wp config set DB_HOST "$WORDPRESS_DB_HOST" --allow-root


if ! wp core is-installed --allow-root; then
    wp core install --url="https://localhost" \
      --title="42-inception" \
      --admin_user=$ADMIN_NAME \
      --admin_password=$ADMIN_PASSWORD \
      --admin_email="super@example.com" \
      --allow-root
    echo "WordPress installed successfully."
fi 

if ! wp user get $USER_NAME --allow-root ; then
    wp user create $USER_NAME $USER_NAME@example.com \
      --role=editor --user_pass=$USER_PASSWORD \
      --display_name=$USER_NAME --allow-root
    echo "Editor user '$USER_NAME' created successfully."
fi

wp plugin install redis-cache --allow-root
sleep 5
wp plugin activate redis-cache --allow-root

wp config set WP_REDIS_HOST 'redis' --allow-root
wp config set WP_CACHE 'true' --allow-root
wp config set FS_METHOD 'direct' --allow-root
wp config set WP_REDIS_PORT '6379' --allow-root
wp redis enable --allow-root
echo "Redis cache configured successfully..."

chmod -R 777 /var/www/html/ 
mkdir -p /run/php  

echo "WordPress is running successfully..."
php-fpm7.4 -F
