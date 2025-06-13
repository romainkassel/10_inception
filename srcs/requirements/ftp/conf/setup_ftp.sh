#!/bin/bash

FTP_USER_PASSWORD=`cat /run/secrets/ftp_user_password`;

useradd $FTP_USER;
echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd;
chown nobody:nogroup /home/$FTP_USER/ftp;
chown $FTP_USER:$FTP_USER /home/$FTP_USER;
chmod a-w /home/$FTP_USER/ftp;
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/wordpress;

chmod 777 /home/$FTP_USER/ftp/wordpress;

echo "$FTP_USER" | sudo tee -a /etc/vsftpd.userlist;

openssl req -x509 -nodes -subj "/CN=ftp" -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem;

mkdir -p /var/run/vsftpd;

exec /usr/sbin/vsftpd;