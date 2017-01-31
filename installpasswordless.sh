#!/bin/bash
echo "This script will install hadoop on a fresh docker instance of centos 7"

if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to use this script"
  exit 1
fi


curl https://raw.githubusercontent.com/abhishekunotech/install_scripts/master/install_scala.sh > install_scala.sh
chmod +x install_scala.sh
./install_scala.sh

echo $JAVA_HOME

sleep 2

figlet -f banner "Scala Installed :-)"
figlet -f small "Installing Passwordless SSH ..."

sleep 1
#Installing passwordless SSH


cd ~
yum install openssh-server openssh-clients openssh

ssh-keygen -t rsa -q 

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

chmod 0600 ~/.ssh/authorized_keys

service sshd start



figlet -f banner "Passwordless SSH Installed :-)"

sleep 1