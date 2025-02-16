FROM debian:buster

COPY /conf/setup_adminer.sh setup_adminer.sh

ARG DOMAIN_NAME

RUN mkdir -p /etc/nginx/sites-available-tmp && \
    chmod -R 755 /etc/nginx/sites-available-tmp

COPY /conf/adminer /etc/nginx/sites-available-tmp/adminer

RUN sed -i "s/blank/adminer.${DOMAIN_NAME}/g" /etc/nginx/sites-available-tmp/adminer && \
    apt update && \
    apt upgrade -y && \
    apt install adminer zsh vim wget sudo git -y && \
    chmod -R 777 -R /etc/nginx/sites-available-tmp/adminer && \
    chmod -R 755 setup_adminer.sh

ENTRYPOINT ["/setup_adminer.sh"]