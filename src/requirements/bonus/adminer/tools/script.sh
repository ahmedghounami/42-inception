#!/bin/bash

mkdir -p /run/php

wget "https://www.adminer.org/latest.php" -O /var/www/html/adminer.php 

chmod +x /var/www/html/adminer.php

php-fpm7.4 -F
