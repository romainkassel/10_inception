#!/bin/bash

sleep 60;

sed -i "58 adefine('WP_CACHE_KEY_SALT', '$DOMAIN_NAME');" /var/www/wordpress/wp-config.php;
sed -i "59 adefine( 'WP_CACHE', true );" /var/www/wordpress/wp-config.php;
sed -i "60 adefine( 'WP_REDIS_HOST', 'redis' );" /var/www/wordpress/wp-config.php;
sed -i "61 adefine( 'WP_REDIS_PORT', '6379' );" /var/www/wordpress/wp-config.php;

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
php wp-cli.phar --info;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
wp --info

redis-server --daemonize yes --protected-mode no;

sudo -u nobody wp plugin install redis-cache --activate --path=/var/www/wordpress;
sudo -u nobody wp redis enable --path=/var/www/wordpress;

redis-cli shutdown;

exec redis-server --protected-mode no;