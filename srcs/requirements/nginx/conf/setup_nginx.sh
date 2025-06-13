#!/bin/bash

sed -i "s/blank/$DOMAIN_NAME/g" /etc/nginx/sites-available/wordpress;

mv /etc/nginx/sites-available/default /etc/nginx/default;
sudo ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/;
mv /etc/nginx/default /etc/nginx/sites-available/default;

exec nginx -g 'daemon off;';
