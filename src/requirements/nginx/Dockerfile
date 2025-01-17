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

# COPY script.sh /script.sh

# RUN chmod +x /script.sh
# Copy custom NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
# EXPOSE 80


# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]

# CMD ["bash"]


# Update the package list and install NGINX
# RUN apt update && \
#     apt install -y nginx && \
#     apt clean && \
#     rm -rf /var/lib/apt/lists/*

# # Copy custom NGINX configuration (optional)
# COPY ./nginx.conf /etc/nginx/nginx.conf

# # Expose the default HTTP port
# EXPOSE 80

# # Command to start NGINX in the foreground
# CMD ["nginx", "-g", "daemon off;"]

# apt install nginx
# vim /etc/nginx/conf.d/default.conf

# server {
#     listen 80;
#     server_name localhost;

#     location / {
#         proxy_pass http://wordpress-container:80;
#         proxy_set_header Host $host;
#         proxy_set_header X-Real-IP $remote_addr;
#         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#     }
# }


# service nginx restart
# service php7.4-fpm start