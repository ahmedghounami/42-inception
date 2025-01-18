# Use Debian as the base image
FROM debian:11

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

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

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443


COPY script.sh /script.sh

RUN chmod +x /script.sh
    
# Start NGINX in the foreground
CMD ["/script.sh"]
# CMD ["nginx", "-g", "daemon off;"]
