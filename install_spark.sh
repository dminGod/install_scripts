#!/bin/bash

echo "This script will install spark on a fresh docker instance of centos 7"

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to use this script"
  exit 1
fi

curl https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/installpasswordless.sh > installpass.sh
chmod +x installpass.sh
./installpass.sh

echo -e "We are inside install spark"
echo $JAVA_HOME

cd /opt

mkdir spark && cd spark

wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz

tar -zxvf spark-2.0.0-bin-hadoop2.7.tgz

export SPARK_HOME=/opt/spark/spark-2.0.0-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH

echo "export SPARK_HOME=/opt/spark/spark-2.0.0-bin-hadoop2.7" >> /etc/bashrc
echo "export PATH=$SPARK_HOME/bin:$PATH" >> /etc/bashrc

source /etc/bashrc

cd $SPARK_HOME/conf

cp spark-env.sh.template spark-env.sh

cat <<EOF >>spark-env.sh
export JAVA_HOME=$JAVA_HOME
EOF

cd $SPARK_HOME
./sbin/start-all.sh


jps

curl localhost:8080



figlet -f banner "SPARK Installed :-)"
figlet -f small "FINISHED Installing Spark ..."

sleep 1
