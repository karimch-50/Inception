#!/bin/bash


#need to find a way to get the exact ip for the current container

sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php7/php-fpm.d/www.conf

wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
rm latest.tar.gz


#install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp


sed -i "s/username_here/wp_user/g" wordpress/wp-config-sample.php
sed -i "s/password_here/1234/g" wordpress/wp-config-sample.php
sed -i "s/localhost/mariadb/g" wordpress/wp-config-sample.php
sed -i "s/database_name_here/wordpress/g" wordpress/wp-config-sample.php
cp  wordpress/wp-config-sample.php wordpress/wp-config.php


exec php-fpm7 -F