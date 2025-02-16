FROM debian:buster

COPY /conf/website website
COPY /conf/website_content /var/www/website
COPY /conf/setup_website.sh setup_website.sh

ARG DOMAIN_NAME

RUN mkdir -p /etc/nginx/sites-available-tmp && \
    sed -i "s/blank/website.${DOMAIN_NAME}/g" website && \
    mv website /etc/nginx/sites-available-tmp/website && \
    apt update && \
    apt upgrade -y && \
    apt install vim zsh sudo -y && \
    chmod -R 755 /var/www/website && \
    chmod -R 755 /etc/nginx/sites-available-tmp/website && \
    chmod -R 755 setup_website.sh

ENTRYPOINT ["/setup_website.sh"]