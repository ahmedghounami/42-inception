#!/bin/bash

FTP_USER=$FTP_USER
FTP_PASS=$FTP_PASS
USER_HOME="/var/ftp"

WP_VOLUME="/var/www/html"

ln -sf "$WP_VOLUME" "$USER_HOME" 

useradd -d "$USER_HOME" -s /bin/bash "$FTP_USER"

echo "$FTP_USER:$FTP_PASS" | chpasswd 

chown -R "$FTP_USER:$FTP_USER" "$USER_HOME"

mkdir -p /var/run/vsftpd/empty 

echo "FTP user created: $FTP_USER successfully ..."


vsftpd /etc/vsftpd.conf