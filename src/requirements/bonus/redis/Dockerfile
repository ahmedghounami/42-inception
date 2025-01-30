
FROM debian:11

# Install Redis and necessary dependencies
RUN apt-get update && apt-get install -y \
    redis && \ 
    apt install -y php-redis
# Expose the Redis default port
EXPOSE 6379

# Command to start Redis server with a custom configuration
CMD redis-server --protected-mode no
