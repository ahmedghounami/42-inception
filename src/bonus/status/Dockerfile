FROM debian:bookworm

# Install curl and cron
RUN apt-get update && apt-get install -y curl cron

# Create a script to check WordPress status
RUN echo '#!/bin/bash\nURL="http://nginx"\nif curl -s --head --request GET $URL | grep "200 OK" > /dev/null; then\n  echo "$(date): WordPress is UP" >> /var/log/wordpress_status.log\nelse\n  echo "$(date): WordPress is DOWN" >> /var/log/wordpress_status.log\nfi' > /check_wordpress.sh && chmod +x /check_wordpress.sh

# Add a cron job to check status every minute
RUN echo "* * * * * /check_wordpress.sh" > /etc/cron.d/wordpress-monitor

# Apply the cron job
RUN crontab /etc/cron.d/wordpress-monitor

# Expose log directory as a volume
VOLUME /var/log

CMD ["cron", "-f"]
