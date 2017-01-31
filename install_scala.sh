#!/bin/bash

echo "This script will install scala on a fresh docker instance of centos 7"

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to use this script"
  exit 1
fi

curl https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/install_java.sh > installjava.sh
chmod +x installjava.sh

./installjava.sh

cd /opt

mkdir scala && cd scala

wget http://downloads.lightbend.com/scala/2.12.0/scala-2.12.0.tgz

tar -zxvf scala-2.12.0.tgz

echo -e "\n\n Setting up environment variables, temporary and permanent..."
export SCALA_HOME=/opt/scala/scala-2.12.0
export PATH=$SCALA_HOME/bin:$PATH


echo "export SCALA_HOME=/opt/scala/scala-2.12.0" >> /etc/bashrc
echo "export PATH=$SCALA_HOME/bin:$PATH" >> /etc/bashrc

source /etc/bashrc


scala -version




figlet -f banner "Scala Installed :-)"
figlet -f small "FINISHED Installing Scala ..."

sleep 1