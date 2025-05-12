FROM debian:bullseye

EXPOSE 3306

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/entrypoint.sh /etc/mysql/entrypoint.sh

RUN chmod +x /etc/mysql/entrypoint.sh
