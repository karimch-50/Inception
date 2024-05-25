#!/bin/bash

echo "Downloading WordPress ..."
wget https://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
rm latest.tar.gz

exec php-fpm7 -F