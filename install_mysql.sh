
wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

yum localinstall -y mysql57-community-release-el7-9.noarch.rpm

yum install -y mysql-community-server

service mysqld start

sudo chkconfig mysqld on


mysql

CREATE USER 'hadoop'@'localhost' IDENTIFIED BY 'P@$$w0rD';
