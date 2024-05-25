#!/bin/bash




#need to find a way to get the exact ip for the current container
sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php7/php-fpm.d/www.conf

# wget https://wordpress.org/latest.tar.gz
# tar xvzf latest.tar.gz
# rm latest.tar.gz

# cd /var/www/html/wordpress && rm -rf *


# #install wp-cli
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar 
# mv wp-cli.phar /usr/local/bin/wp

# pwd
# sed -i "s/username_here/wp_user/g" wp-config-sample.php
# sed -i "s/password_here/1234/g" wp-config-sample.php
# sed -i "s/localhost/mariadb/g" wp-config-sample.php
# sed -i "s/database_name_here/wordpress/g" wp-config-sample.php
# cp  wp-config-sample.php wp-config.php


# # wp core install --allow-root --url=${DOMAINE_NAME} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}

# wp core install --allow-root --url=kchaouki.com \
#                 --title=test --admin_user=karim \
#                 --admin_password=1234 --admin_email=karim@gmail.com

# exec php-fpm7 -F



# Download WordPress
wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
rm latest.tar.gz

cd /var/www/html/wordpress

# Modify configuration
sed -i "s/username_here/wp_user/g" wp-config-sample.php
sed -i "s/password_here/1234/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
sed -i "s/database_name_here/wordpress/g" wp-config-sample.php

cp wp-config-sample.php wp-config.php

# Install wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

# Install WordPress
wp core install --allow-root --url=kchaouki.com \
                --title=test --admin_user=karim \
                --admin_password=1234 --admin_email=karim@gmail.com

echo "Creating users..."
wp user create wp_user wp_user@gmail.com \
    --role=editor --user_pass=1234 \
    --path=/var/www/html/wordpress --allow-root

exec php-fpm7 -F