
FROM debian:11


RUN apt-get update && apt-get install -y \
    redis && \ 
    apt install -y php-redis


EXPOSE 6379

CMD redis-server --protected-mode no
