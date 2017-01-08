

curl https://raw.githubusercontent.com/dminGod/install_scripts/master/install_java.sh | bash


wget -nv http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.1.0/ambari.repo -O /etc/yum.repos.d/ambari.repo

yum install -y ambari-server


echo "root:root" | chpasswd


ambari-server -s setup

ambari-server start

ambari-server status
