FROM   debian:11

RUN    mkdir -p /website/index

COPY   index.html /website/index/index.html

COPY   assets /website/index/assets

RUN apt update && apt upgrade

RUN apt install -y php php-mysql wget

RUN     chmod +x -R /website/index

RUN    apt-get install -y php-fpm php-cli

RUN    mkdir /run/php

EXPOSE 9090

CMD ["php",  "-S",  "0.0.0.0:9090",  "-t",  "/website/index"]