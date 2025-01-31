# Use Debian 11 as the base image
FROM debian:11

RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    mariadb-client \
    && apt-get clean

COPY tools/init-mariadb.sh /init-mariadb.sh

RUN chmod +x /init-mariadb.sh

EXPOSE 3306

CMD ["/init-mariadb.sh"]
