#!/bin/bash

Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
NC='\033[0m' # No Color

mkdir -p wordpress

cd wordpress

#need to find a way to get the exact ip for the current container
sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/7.4/fpm/pool.d/www.conf

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "${Yellow} Wordpress already has been setupped !!${NC}"
else
    echo "${Yellow}Downloading wp-cli ...${NC}"
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    echo "${Green}wp-cli is downloaded !!${NC}"

    chmod +x wp-cli.phar

    mv wp-cli.phar /usr/local/bin/wp

    # Download wordpress with a specific language
    echo "${Yellow}Downloading WordPress ...${NC}"
    wp core download --locale=en_US --allow-root
    echo "${Green}WordPress downloaded !!${NC}"

    wp config create --dbname=wordpress \
                    --dbuser=kchaouki \
                    --dbhost=mariadb \
                    --dbpass=1234 \
                    --dbprefix="wp_" \
                    --allow-root \
                    --skip-check #the database connection is not checked

    # Checks the current status of the database.
    # wp db check


    # Install WordPress
    wp core install --allow-root \
                    --title="This is my website" \
                    --admin_user=karim \
                    --admin_password=1234 \
                    --admin_email=karim@gmail.com \
                    --url=kchaouki.42.fr

    # echo "Creating users..."
    wp user create wp_user wp_user@gmail.com \
        --role=editor \
        --user_pass=1234 \
        --allow-root
fi

exec php-fpm7.4 -F