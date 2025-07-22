# 10_inception

## Project overview

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

## How to use this repository?

### Recommended Operating System (OS)

I recommand to use a Linux distribution such as:

- Latest stable version (LTS) of Ubuntu
- Latest stable version (LTS) of Debian

### Prerequisites

This project is using Docker.
In order to follow the steps below, you have to install Docker packages first.

### Steps to follow

1. Go to the directory where you want to clone the directory: `cd path/of/repository/`
2. Clone this repository: `git clone git@github.com:romainkassel/10_inception.git`
3. Enter into cloned repository: `cd 10_inception`
4. If you have VS Code installed, open it: `code .`
5. At the root of this repository, rename the `secrets.example` folder to `secrets`: `mv secrets.example secrets`
6. Set a custom password within each `.txt` file included within this folder (it will be useful to access different services)
7. Within the folder `srcs/`, rename rename the `.env.example` file to `.env`: `mv srcs/.env.example srcs/.env`
8. Associate a value to each environment variable listed in the .env file

> [!NOTE]
> You find your `LOGIN` by running `echo $USER` in your terminal<br />
> You can leave the variable `DB_HOST` as it is<br />
> If you have any trouble at this step, please contact me!

7. Still at the root of the repository, launch the project's build: `make`
8. Once the project has been built and services started, you should see something like this in your terminal:

<img width="345" height="202" alt="inception-docker-build-done" src="https://github.com/user-attachments/assets/399c1d6a-9c4e-4bf4-80fa-27a06d61eaf4" />

9. Here you go! All services are now running and ready to be checked.

## Services to access

### Wordpress

Wordpress is the most popular Content Management System (CMS) and is the main service of this projet.

To access it, you need to:
1. Open your favorite browser
2. Add the DOMAIN_NAME you set up in the .env file to your browser by:
  - Entering `about:config` in the address bar (if you are on Firefox)
  - Clicking on `Accept the risk and continue`
  - Searching for `network.dns.localDomains`
  - Updating `network.dns.localDomains` by adding your DOMAIN_NAME
3. Go to the following URL: `https://{DOMAIN_NAME}:443` (for example: `https://rkassel.42.fr:443`

<img width="1466" height="914" alt="inception-wordpress-service" src="https://github.com/user-attachments/assets/e15aa2e2-8af5-4e08-a9e1-c6013ddd156b" />


## I tested this site and I'm happy. Now I'd like to clean it up. What do I do?

1. In your terminal, stop Docker services by clicking on `CTRL + C`
2. Run the following command to remove everything (containers, images and volumes): `make fclean`
3. Go outside of the repository: `cd ..`
4. Remove the repository: `rm -rf 10_inception`
