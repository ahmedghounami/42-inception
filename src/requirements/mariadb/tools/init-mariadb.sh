#!/bin/bash

service mariadb start

sleep 10

mariadb -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mariadb -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

echo "mariadb is running successfully ..."

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
