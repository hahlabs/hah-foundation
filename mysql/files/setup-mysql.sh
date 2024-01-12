#!/bin/bash
# modify mysql user to allow login
apt install -y mysql-server 
mkdir /home/mysql
usermod -d /home/mysql -s /bin/bash mysql 
chown mysql:mysql /home/mysql 
chmod g+rwx /var/run/mysqld 
sed -Ei "s/127.0.0.1/0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf 
echo 'mysql:MySql!123' | chpasswd 
usermod -aG mysql hahlabs
service mysql start