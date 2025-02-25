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
