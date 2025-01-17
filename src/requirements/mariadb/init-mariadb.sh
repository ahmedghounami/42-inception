#!/bin/bash

# Start MariaDB in the background
service mariadb start

# Wait for the MariaDB service to start
sleep 5


# Run SQL commands to create database and user
mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

echo $MARIADB_DATABASE
echo $MARIADB_USER
echo $MARIADB_PASSWORD


service mariadb stop

# Keep MariaDB running in the foreground
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
