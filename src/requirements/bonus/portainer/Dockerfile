FROM debian:11
RUN apt update && apt install -y wget

RUN mkdir -p /opt

RUN wget https://github.com/portainer/portainer/releases/download/2.25.1/portainer-2.25.1-linux-amd64.tar.gz -P /opt
RUN tar -xvf /opt/portainer-2.25.1-linux-amd64.tar.gz -C /opt 
RUN rm -rf /opt/portainer-2.25.1-linux-amd64.tar.gz 
COPY script.sh /usr/bin/script.sh
EXPOSE 9001
RUN chmod +x /usr/bin/script.sh
CMD ["script.sh"]