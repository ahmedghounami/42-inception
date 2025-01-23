#!/bin/bash

# Create FTP user
FTP_USER="ftpuser"
FTP_PASS="ftppassword"
USER_HOME="/var/ftp"

# Ensure the FTP directory points to the WordPress volume
WP_VOLUME="/var/www/html"  # This should be the mounted WordPress volume
ln -sf "$WP_VOLUME" "$USER_HOME"

# Create the FTP user
useradd -d "$USER_HOME" -s /bin/bash "$FTP_USER"
echo "$FTP_USER:$FTP_PASS" | chpasswd

# Set correct permissions
chown -R "$FTP_USER:$FTP_USER" "$USER_HOME"
mkdir -p /var/run/vsftpd/empty
echo "FTP user created: $FTP_USER successfully ..."

# Start the FTP server
vsftpd /etc/vsftpd.conf
