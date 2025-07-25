# 10_inception

## Project overview

This project aims to expand its knowledge of system administration using Docker.<br />
This requires virtualising several Docker images by creating them in a virtual machine.

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
7. Within the folder `srcs/`, rename the `.env.example` file to `.env`: `mv srcs/.env.example srcs/.env`
8. Set a custom value for each environment variable listed in the `.env` file

> [!NOTE]
> You can find the value for `LOGIN` by running `echo $USER` in your terminal<br />
> You can leave the variable `DB_HOST` as it is<br />
> If you have any trouble at this step, please contact me!

9. Still at the root of the repository, launch the project's build: `make`
10. Once the project has been built and services started, you should see something like this in your terminal:

<img width="345" height="202" alt="inception-docker-build-done" src="https://github.com/user-attachments/assets/399c1d6a-9c4e-4bf4-80fa-27a06d61eaf4" />

11. Here you go! All services are now running and ready to be checked.

## Services to access

### Wordpress

Wordpress is the most popular Content Management System (CMS) and also the main service of this project.

To access it, you need to:
1. Open your favorite browser
2. Add the DOMAIN_NAME you set up in the .env file to your browser by:
  - Entering `about:config` in the address bar (if you are using Firefox)
  - Clicking on `Accept the risk and continue`
  - Searching for `network.dns.localDomains`
  - Updating `network.dns.localDomains` by adding your DOMAIN_NAME
3. Go to the following URL: `https://{DOMAIN_NAME}/` (for example: `https://rkassel.42.fr/`

> [!NOTE]
> You are warned that the site is not secure and it is true<br/>
> I used the HTTPS protocol for this website and, as a student project, I have not submitted the SSL certificates for validation by an official authority<br/>
> You can trust me and agree to continue browsing the website despite this warning!

<img width="1466" height="875" alt="inception-docker-wordpress-container" src="https://github.com/user-attachments/assets/a2d1864e-8811-4e1c-b8bd-9baffebf8a93" />

### Redis cache

Redis is a tool that allows to cache queries made to the database. Data is stored in memory, which helps optimise application performance.

To see Redis in action, you need first to go to the Wordpress administration login page: `https://{DOMAIN_NAME}/wp-admin/` (for example: `https://rkassel.42.fr/wp-admin/`)

Credentials are:
- Username or Email Address: value of `ADMIN_USER` from the .env file
- Password: content from `secrets/wp_admin_password.txt`

Once on the administration, go to `Settings` > `Redis` and the `Metrics` tab to see data (you need clicks and time to see something)

<img width="2940" height="1670" alt="inception-docker-redis-cache-container-wordpress" src="https://github.com/user-attachments/assets/df9fabe8-ba60-4a98-b7e8-bee5b80a5447" />

### Static website

Go to the following URL: `https://{DOMAIN_NAME}/website/` (for example: `https://rkassel.42.fr/website/`)

<img width="1467" height="875" alt="inception-docker-static-website-container" src="https://github.com/user-attachments/assets/7d85f5d3-41d7-4dc0-81bf-87c99b75501d" />

### Adminer

Go to the following URL: `https://{DOMAIN_NAME}/adminer` (for instance: `https://rkassel.42.fr/adminer`)

<img width="1470" height="871" alt="inception-docker-adminer-login-container" src="https://github.com/user-attachments/assets/727b7d94-7baf-4538-9f43-721942a323ba" />

To log in, you can use the following credentials:
- System: `MySQL`
- Server: `mariadb:3306`
- User: value of `MYSQL_USER` from the .env file
- Password: content from `secrets/db_password.txt`
- Database: value of `MYSQL_DATABASE` from the .env file

### Grafana

Grafana is a monitoring and observability tool.

For this project, data sources come from Redis cache and MariaDB containers.

Go to following URL: `https://{DOMAIN_NAME}/grafana/login` (for instance: `https://rkassel.42.fr/grafana/login`)

<img width="1468" height="876" alt="inception-docker-grafana-monitoring-container" src="https://github.com/user-attachments/assets/fca94a9d-2b53-49ea-a8a4-5a860521ea34" />

You can log in by using the following credentials:
- Email or username: value of `GRAFANA_USER` from the .env file
- Password: content from `secrets/grafana_user_password.txt`

### MariaDB

To access the MariaDB database, you have 3 different choices:

1. Use terminal by:
  - Entering MariaDB shell container: `docker exec -it mariadb sh`
  - Entering the MySQL Command-Line Client: `mysql -u root -p{password}` (the password being the content from `secrets/db_root_password.txt`)

2. Using the Adminer interface (as seen above)

3. Using Grafana and its data source attached to MariaDB

<img width="2940" height="1670" alt="inception-docker-grafana-monitoring-container-mariadb-data-source" src="https://github.com/user-attachments/assets/a4b6b6c1-abc0-486a-88b5-6c9efe6432bc" />

### FTP

For this service, I used the FTP server `vsftpd`.

To test it, you can:
1. Download and launch `FileZilla`
2. Click on the button `Open the site manager` on the top left hand corner
3. Click on `New site` from the `My sites` folder
4. Set `localhost` within the `Host` field
5. Select the following option for `Encryption`: `Require explicit FTP over TLS`
6. Set the `User` field with the value of `FTP_USER` from the .env file
7. Click on `Connect`
8. Fill the password with the content from `secrets/ftp_user_password.txt`
9. Click on `OK`
10. Click on `OK` again

And now you can manage files related to the Wordpress repository!

<img width="1469" height="886" alt="inception-docker-ftp-server-container" src="https://github.com/user-attachments/assets/52a15b52-9b90-4251-8c3e-b6c399d45dfb" />

## I tested this site and I'm happy. Now I'd like to clean it up. What do I do?

1. In your terminal, run the following command to remove everything (containers, images and volumes): `make fclean`
2. Enter your environment password when asked
3. Go outside of the repository: `cd ..`
4. Remove the repository: `rm -rf 10_inception`
