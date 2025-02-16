FROM debian:buster

RUN apt update && \
    apt upgrade -y && \
    apt install nginx openssl systemd sudo ca-certificates curl procps vim zsh -y && \
    mkdir -p /var/www/wordpress && \
    mkdir /etc/nginx/certs && \
    mkdir /usr/share/nginx/img

COPY /conf/default.conf /etc/nginx/conf.d/default.conf
COPY /conf/404.html /usr/share/nginx/html/404.html
COPY /conf/favicon.ico /usr/share/nginx/img/favicon.ico

ARG DOMAIN_NAME

RUN openssl genrsa -out /etc/nginx/certs/myCA.key 2048 && \
    openssl req -x509 -new -nodes -subj "/CN=${DOMAIN_NAME}" -key /etc/nginx/certs/myCA.key -sha256 -days 1825 -out /etc/nginx/certs/myCA.pem && \
    cp /etc/nginx/certs/myCA.pem /usr/local/share/ca-certificates/myCA.crt && \
    update-ca-certificates && \
    chmod -R 755 /usr/share/nginx/img/favicon.ico

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]