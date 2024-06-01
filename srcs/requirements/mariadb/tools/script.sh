#!/bin/bash

# Set permissions on directories
mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start
mariadb <<-EOF
CREATE DATABASE wordpress;
CREATE USER 'kchaouki' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON wordpress.* TO 'kchaouki'@'%';
FLUSH PRIVILEGES;
EOF

service mariadb stop

exec mariadbd