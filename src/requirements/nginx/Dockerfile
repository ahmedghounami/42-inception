
FROM debian:11


# Install NGINX
RUN apt update && \
    apt install -y nginx && \
    apt install -y openssl && \
    apt install -y vim && \
    apt clean

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=US/ST=State/L=City/O=Example/CN=localhost"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443


COPY tools/script.sh /script.sh

RUN chmod +x /script.sh
    

CMD ["/script.sh"]
