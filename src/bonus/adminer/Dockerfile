
FROM    debian:11

RUN apt update && apt upgrade

RUN apt install -y php php-mysql wget

RUN wget "https://www.adminer.org/latest.php" -O /var/www/html/index.php

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]

