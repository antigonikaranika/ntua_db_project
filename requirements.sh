#! /usr/bin/bash

#MariaDB Connector/Python Requirements
apt -y install libmariadb3 libmariadb-dev

apt -y install mariadb-server
apt-get -y install mariadb-backup
mysql_secure_installation
systemctl start mariadb.service

#If anaconda isn't installed
#bash ./Anaconda3-2024.02-1-Linux-x86_64.sh
