FROM debian:Bookworm

COPY conf/setup_ftp.sh setup_ftp.sh

RUN apt update && \
    apt upgrade -y && \
    apt install vsftpd sudo zsh ftp -y && \
    chmod 777 setup_ftp.sh

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod -R 777 /etc/vsftpd.conf

ENTRYPOINT ["/setup_ftp.sh"];