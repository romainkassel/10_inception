FROM debian:Bookworm

RUN apt update && \
    apt upgrade -y && \
    mkdir -p /var/run/php && \
    chmod -R 755 /var/run/php && \
    apt install sudo wget php7.3-fpm php-mysql mariadb-client procps zsh vim -y && \
    php -v && \
    wget https://wordpress.org/wordpress-6.7.1.tar.gz -P /var/www && \
    cd /var/www && tar -xvf wordpress-6.7.1.tar.gz && rm wordpress-6.7.1.tar.gz && \
    mkdir -p /var/www/wordpress && \
    chmod 755 -R /var/www/wordpress && \
    groupadd wordpress_usergroup && \
    useradd -g wordpress_usergroup wordpress_user

COPY /conf/wordpress_pool.conf /etc/php/7.3/fpm/pool.d/wordpress_pool.conf

COPY /conf/auto_config.sh ./auto_config.sh

RUN chmod 755 /etc/php/7.3/fpm/pool.d/wordpress_pool.conf && \
    chmod 755 auto_config.sh

ENTRYPOINT ["/auto_config.sh"];