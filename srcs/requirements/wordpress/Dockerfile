FROM debian:bullseye

WORKDIR /var/www/html

RUN mkdir -p /run/php

RUN apt update

RUN apt install php-fpm -y

RUN apt install php-mysql -y

RUN apt install curl -y

RUN apt install mariadb-client -y

COPY tools/script.sh /usr/local/bin/wp_script

RUN chmod +x /usr/local/bin/wp_script

ENTRYPOINT ["wp_script"]

# -F stay in the forgound
CMD ["php-fpm7.4","-F"]