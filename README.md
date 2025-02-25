# Project #11 - Inception

This project aimed to broaden my knowledge of system administration by using Docker.

I had to virtualize several Docker images, creating them in a personal virtual machine (using both Virtual Box and UTM tools).

The purpose was to create a Docker network including the 3 following services:
- nginx, a web server
- mariadb, an open source relational database derived from MySQL
- wordpress (with php-fpm)

I also had the opportunity to set up 5 extra services as bonuses:
- Redis cache, to properly monitor the WordPress website cache
- a FTP server, pointing to the docker volume of the WordPress website
- a simple static website in HTML
- Adminer, a minimalist database management tool included in a single PHP file
- Grafana, an open source analytics and monitoring solution plugged with Redis service and MariaDB database

## Prerequisites

Before running the "Make" command, you have to include a "secrets" folder at the root of the repository.

It has to include the following txt files with your own passwords:
- db_password.txt
- db_root_password.txt
- ftp_user_password.txt
- grafana_user_password.txt
- wp_admin_password.txt
- wp_user_password.txt

You also have to include a ".env" file at the root of the "srcs" folder.

This hidden file should include the following variables:

#GLOBAL

LOGIN=yourcontent

DOMAIN_NAME=yourcontent

#MYSQL SETUP

MYSQL_USER=yourcontent

MYSQL_DATABASE=yourcontent

#WORDPRESS SETUP

DB_HOST=mariadb:3306

ADMIN_USER=yourcontent

ADMIN_EMAIL=yourcontent

USER_USER=yourcontent

USER_EMAIL=yourcontent

#FTP

FTP_USER=yourcontent

#GRAFANA

GRAFANA_USER=yourcontent

For security and confidentiality purposes, these informations can't be uploaded online.
