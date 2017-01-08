curl https://raw.githubusercontent.com/dminGod/install_scripts/master/local_repo.sh > local_repo.sh 
bash local_repo.sh
yum install -y openssh-* initscripts 
service sshd start