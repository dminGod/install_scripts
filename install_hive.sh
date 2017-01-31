#!/bin/bash

function help() {

	echo "Usage: $0 <mysql / default>"
}

if [ $# -gt 1 ]
then
	help
	exit 1
fi


echo "This script will install hive on a fresh docker instance of centos 7"

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to use this script"
  exit 1
fi

curl https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/install_hadoop.sh > install_hadoop.sh
chmod +x install_hadoop.sh
./install_hadoop.sh



cd /opt
mkdir hive && cd hive

wget http://www-eu.apache.org/dist/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz

tar -zxvf apache-hive-1.2.1-bin.tar.gz



export HIVE_HOME=/opt/hive/apache-hive-1.2.1-bin
export PATH=$HIVE_HOME/bin:$PATH
export CLASSPATH=$CLASSPATH:$HADOOP_HOME/lib/*:.
export CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/*:.

echo "export HIVE_HOME=/opt/hive" >> /etc/bashrc
echo "PATH=$HIVE_HOME/bin:$PATH" >> /etc/bashrc
echo "export CLASSPATH=$CLASSPATH:$HADOOP_HOME/lib/*:." >> /etc/bashrc
echo "export CLASSPATH=$CLASSPATH:$HIVE_HOME/lib/*:." >> /etc/bashrc

source /etc/bashrc


cd $HIVE_HOME/conf
cp hive-env.sh.template hive-env.sh


cat <<EOF >>hive-env.sh
export HADOOP_HOME=$HADOOP_HOME
EOF

cp hive-default.xml.template hive-site.xml


stop-all.sh

start-all.sh

jps


curl localhost:50070



figlet -f banner "HIVE Installed :-)"
figlet -f small "Installing MYSQL ..."

sleep 1


wget https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm

yum localinstall -y mysql57-community-release-el7-9.noarch.rpm


yum-config-manager --disable mysql57-community
yum-config-manager --enable mysql56-community

yum install -y mysql-community-server