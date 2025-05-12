#!/bin/bash

echo "Starting MariaDB..."
service mariadb start

until mysqladmin ping --silent; do
  echo "⏳ En attente de MariaDB..."
  sleep 2
done

echo "Generating database..."
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"

echo "Creating user..."
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"

mysql -e "FLUSH PRIVILEGES;"


echo "Stopping MariaDB..."
mysqladmin -u root shutdown

exec mariadbd

