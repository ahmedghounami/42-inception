FROM debian:11

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install FTP server
RUN apt update && \
    apt install -y vsftpd && \
    apt clean

# Copy the configuration file
COPY vsftpd.conf /etc/vsftpd.conf

# Create a directory for the FTP server
RUN mkdir -p /var/ftp

# Copy the script to start the FTP server
COPY script.sh /script.sh

# Make the script executable
RUN chmod +x /script.sh
# Expose the FTP port
EXPOSE 21

# Start the FTP server in the foreground
CMD ["/script.sh"]
# CMD ["vsftpd", "/etc/vsftpd.conf"]
