FROM debian:bookworm

RUN apt update && \
    apt upgrade -y && \
    apt install sudo -y && \
    sudo apt install nginx openssl systemd ca-certificates curl procps vim zsh -y && \
    mkdir -p /var/www/wordpress && \
    mkdir /etc/nginx/certs && \
    mkdir /usr/share/nginx/img

COPY /conf/404.html /usr/share/nginx/html/404.html
COPY /conf/favicon.ico /usr/share/nginx/img/favicon.ico
COPY /conf/wordpress /etc/nginx/sites-available/wordpress
COPY /conf/setup_nginx.sh setup_nginx.sh
COPY /conf/website /var/www/website

ARG DOMAIN_NAME

RUN openssl genrsa -out /etc/nginx/certs/myCA.key 2048 && \
    openssl req -x509 -new -nodes -subj "/CN=${DOMAIN_NAME}" -key /etc/nginx/certs/myCA.key -sha256 -days 1825 -out /etc/nginx/certs/myCA.pem && \
    cp /etc/nginx/certs/myCA.pem /usr/local/share/ca-certificates/myCA.crt && \
    update-ca-certificates && \
    chmod -R 755 /usr/share/nginx/img/favicon.ico && \
    chmod -R 755 /etc/nginx/sites-available/wordpress && \
    chmod -R 755 /var/www/website/index.html && \
    chmod 755 setup_nginx.sh

ENTRYPOINT ["/setup_nginx.sh"]
