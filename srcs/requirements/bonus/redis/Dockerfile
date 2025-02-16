FROM debian:buster

COPY conf/setup_redis.sh setup_redis.sh

RUN apt update && \
    apt upgrade -y && \
    apt install sudo -y && \
    apt install wget php php-mysql redis-server php-redis sudo vim zsh ftp -y && \
    chmod 755 setup_redis.sh

ENTRYPOINT ["/setup_redis.sh"]