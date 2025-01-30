#!/bin/bash

# Create FTP user
FTP_USER=$FTP_USER
FTP_PASS=$FTP_PASS
USER_HOME="/var/ftp"

WP_VOLUME="/var/www/html"

ln -sf "$WP_VOLUME" "$USER_HOME" # Creates a symbolic link from /var/ftp to the WordPress directory /var/www/html to allow FTP access to WordPress files.

useradd -d "$USER_HOME" -s /bin/bash "$FTP_USER"

echo "$FTP_USER:$FTP_PASS" | chpasswd 

chown -R "$FTP_USER:$FTP_USER" "$USER_HOME"

mkdir -p /var/run/vsftpd/empty # for anonymous login to work properly

echo "FTP user created: $FTP_USER successfully ..."

# Start the FTP server in the foreground
vsftpd /etc/vsftpd.conf
