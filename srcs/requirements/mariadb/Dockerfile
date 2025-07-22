FROM debian:bullseye

RUN apt update && \
    apt upgrade -y && \
    apt install mariadb-server sudo procps zsh -y

COPY /conf/my.cnf /etc/mysql/my.cnf
COPY /conf/setup_db.sh setup_db.sh

RUN chmod 755 /etc/mysql/my.cnf && \
    chmod 755 setup_db.sh && \
    mkdir -p /var/lib/mysql && \
    chown mysql:mysql -R /var/lib/mysql && \
    chmod -R 755 /var/lib/mysql && \
    mkdir -p /var/run/mysqld && \
    chown mysql:mysql -R /var/run/mysqld && \
    chmod -R 755 /var/run/mysqld

ENTRYPOINT ["/setup_db.sh"]