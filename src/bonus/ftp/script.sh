#!/bin/bash

# Create FTP user
FTP_USER="ftpuser"
FTP_PASS="ftppassword"
USER_HOME="/var/ftp"

WP_VOLUME="/var/www/html"

ln -sf "$WP_VOLUME" "$USER_HOME" # Creates a symbolic link from /var/ftp to the WordPress directory /var/www/html to allow FTP access to WordPress files.

# Create the FTP user
useradd -d "$USER_HOME" -s /bin/bash "$FTP_USER"

echo "$FTP_USER:$FTP_PASS" | chpasswd 

chown -R "$FTP_USER:$FTP_USER" "$USER_HOME" 

mkdir -p /var/run/vsftpd/empty

echo "FTP user created: $FTP_USER successfully ..."

# Start the FTP server
vsftpd /etc/vsftpd.conf
