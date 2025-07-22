FROM debian:bookworm

COPY /conf/setup_adminer.sh setup_adminer.sh

ARG DOMAIN_NAME

RUN apt update && \
    apt upgrade -y && \
    apt install adminer zsh vim wget sudo git -y && \
    chmod -R 755 setup_adminer.sh

ENTRYPOINT ["/setup_adminer.sh"]