#!/bin/sh

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = *" >> /etc/mysql/my.cnf
echo "root:root" | chpasswd && service ssh restart && service mysql restart
mysql -uroot -proot -e "CREATE DATABASE "$MYSQL_DATABASE
mysql -uroot -proot -e "CREATE USER 'root'@'%' IDENTIFIED BY '"$MYSQL_ROOT_PASSWORD"'"
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"
mysql -uroot -proot -e "USE "$MYSQL_DATABASE
bash


