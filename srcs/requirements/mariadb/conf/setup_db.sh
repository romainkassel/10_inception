#!/bin/bash
trap "exit" SIGINT SIGTERM

service mariadb start;

DB_ROOT_PASSWORD=`cat /run/secrets/db_root_password`;
DB_PASSWORD=`cat /run/secrets/db_password`;

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';"

mariadb -u root -p$DB_ROOT_PASSWORD -e \
"CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES;"

mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown;

exec mysqld;