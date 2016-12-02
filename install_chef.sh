#!/bin/bash

clear

cd /opt
mkdir rpm

cd /opt/rpm

echo -e "get the wget the wget, get"
yum install -y wget

echo -e "Getting installing figlet"
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/f/figlet-2.2.5-9.el7.x86_64.rpm
rpm -ivh figlet-2.2.5-9.el7.x86_64.rpm


figlet -f small "Installing common stuff"
yum install -y iproute openssh-* initscripts vim wget curl lynx telnet nc nmap less wget git


figlet -f small "Chef DK"
wget https://packages.chef.io/stable/el/7/chefdk-0.14.25-1.el7.x86_64.rpm
rpm -ivh chefdk-0.14.25-1.el7.x86_64.rpm


figlet -f small "Chef Server"
wget https://packages.chef.io/stable/el/7/chef-server-core-12.6.0-1.el7.x86_64.rpm
rpm -ivh chef-server-core-12.6.0-1.el7.x86_64.rpm

cd /root
chef generate repo chef-repo

cd /opt

git clone https://github.com/aksh-4793/unoCookbooks.git

mv /opt/unoCookbooks/cookbooks/* /root/chef-repo/cookbooks/

rm -rf /opt/unoCookbooks/

service sshd start



