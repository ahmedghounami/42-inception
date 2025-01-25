#!/bin/bash
sleep 10

echo "listen = 0.0.0.0:9000" >> /etc/php/7.4/fpm/pool.d/www.conf


sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" /var/www/html/wp-config.php
sed -i "s/username_here/$WORDPRESS_DB_USER/" /var/www/html/wp-config.php
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" /var/www/html/wp-config.php
sed -i "s/localhost/$WORDPRESS_DB_HOST/" /var/www/html/wp-config.php

# Install WordPress if not already installed
if ! wp core is-installed --allow-root; then
    wp core install --url="https://localhost:443" \
      --title="My WordPress Site" \
      --admin_user="super" \
      --admin_password="super123" \
      --admin_email="super@example.com" \
      --allow-root
    echo "WordPress installed successfully."
fi

# Create an editor user if it doesn't exist
if ! wp user get ahmed --allow-root > /dev/null 2>&1; then
    wp user create ahmed ahmed@example.com \
      --role=editor --user_pass="ahmed123" \
      --display_name="ahmed" --allow-root
    echo "Editor user 'ahmed' created successfully."
fi

# Install and configure the Redis plugin
wp plugin install redis-cache --allow-root
sleep 5
wp plugin activate redis-cache --allow-root

# Set Redis-related configuration
wp config set WP_REDIS_HOST 'redis' --allow-root
wp config set WP_CACHE 'true' --allow-root
wp config set FS_METHOD 'direct' --allow-root
wp config set WP_REDIS_PORT '6379' --allow-root
wp redis enable --allow-root
echo "Redis cache configured successfully."

# Fix permissions and start PHP-FPM
chmod -R 777 /var/www/html/
mkdir -p /run/php

echo "WordPress is running successfully..."
php-fpm7.4 -F
