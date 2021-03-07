#!/usr/bin/env bash

DBHOST=localhost
DBNAME=mbaimpacta
DBUSER=dbmbauser
DBPASSWD=dbmbauser!

apt-get update
apt-get install vim curl build-essential python-software-properties git

debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"


mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME"
mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASSWD'"

cd /vagrant

# update mysql conf file to allow remote access to the db

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

sudo service mysql restart