#!/bin/bash

sleep 10;

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php;

DB_ROOT_PASSWORD=`cat /run/secrets/db_root_password`;
DB_PASSWORD=`cat /run/secrets/db_password`;
WP_ADMIN_PASSWORD=`cat /run/secrets/wp_admin_password`;
WP_USER_PASSWORD=`cat /run/secrets/wp_user_password`;

sed -i "23s/.*/define( 'DB_NAME', '$MYSQL_DATABASE' );/" /var/www/wordpress/wp-config.php;
sed -i "26s/.*/define( 'DB_USER', '$MYSQL_USER' );/" /var/www/wordpress/wp-config.php;
sed -i "29s/.*/define( 'DB_PASSWORD', '$DB_PASSWORD' );/" /var/www/wordpress/wp-config.php;
sed -i "32s/.*/define( 'DB_HOST', '$DB_HOST' );/" /var/www/wordpress/wp-config.php;

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
php wp-cli.phar --info;
chmod +x wp-cli.phar;
mv wp-cli.phar /usr/local/bin/wp;
wp --info

sudo -u nobody wp db create --path=/var/www/wordpress;
sudo -u nobody wp core install --path=/var/www/wordpress --url="13.51.64.253" --title="WP-INCEPTION" --admin_user=$ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL;
sudo -u nobody wp user create $USER_USER $USER_EMAIL --user_pass=$WP_USER_PASSWORD --path=/var/www/wordpress;
sudo -u nobody wp theme install saaslauncher --activate --path=/var/www/wordpress;

exec /usr/sbin/php-fpm7.3 -F;
