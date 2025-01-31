FROM debian:11



RUN apt update && \
    apt install -y vsftpd && \
    apt install ftp -y && \
    apt clean


COPY vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/ftp


COPY script.sh /script.sh


RUN chmod +x /script.sh


EXPOSE 21

CMD ["/script.sh"]
