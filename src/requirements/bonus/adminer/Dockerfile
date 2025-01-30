
FROM    debian:11

RUN apt update && apt upgrade

RUN apt install -y php php-mysql php7.4-fpm wget

COPY  ./tools/script.sh /

RUN chmod +x /script.sh

CMD ["/script.sh"]
