#!/bin/bash

# Set permissions on directories
mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

# Install MariaDB
mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

# echo "
# USE mysql;
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_RANDOM_ROOT_PASSWORD}';
# CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${USER_PASS}';
# GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
# FLUSH PRIVILEGES;" > init_db.sql


echo "
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';
CREATE DATABASE wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'wp_user'@'%' IDENTIFIED by '1234';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';
FLUSH PRIVILEGES;" > init_db.sql

mariadbd --user=mysql --bootstrap < /init_db.sql

rm -f /init_db.sql

mariadbd --user=mysql --bind-address=0.0.0.0
