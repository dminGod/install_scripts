# Install common stuff
echo -e "\n\n Installing figlet.."
yum install -y wget

cd /opt

wget http://dl.fedoraproject.org/pub/epel/7/x86_64/f/figlet-2.2.5-9.el7.x86_64.rpm
rpm -ivh figlet-2.2.5-9.el7.x86_64.rpm

clear
figlet -f banner "Figlet Installed :)"
figlet -f small "Installing common utilities..."

sleep 1

yum install -y iproute openssh-* initscripts vim wget curl lynx telnet nc nmap less wget man

clear
figlet -f small "Get Java & Install"
sleep 1

# Get Java tar gz :
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz jdk-8u111-linux-x64.tar.gz

# extract it..
tar -zxvf jdk-8u111-linux-x64.tar.gz

cd jdk1.8.0_111

clear 

figlet  -f small "Java Alternatives Setup"
# Alternatives install
echo -e "\n\n Alternatives Setup..."
alternatives --install /usr/bin/java java /opt/jdk1.8.0_111/bin/java 1
alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_111/bin/jar 1
alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_111/bin/javac 1

alternatives --set jar /usr/bin/jar
alternatives --set javac /usr/bin/javac

# Set environment variables, temporary and permanent
echo -e "\n\n Setting up environment variables, temporary and permanent..."
export JAVA_HOME=/opt/jdk1.8.0_111
export JRE_HOME=/opt/jdk1.8.0_111/jre
export PATH=$PATH:/opt/jdk1.8.0_111/bin:/opt/jdk1.8.0_111/jre/bin

echo "export JAVA_HOME=/opt/jdk1.8.0_111" >> /etc/bashrc
echo "export JRE_HOME=/opt/jdk1.8.0_111/jre" >> /etc/bashrc
echo "export PATH=\$PATH:/opt/jdk1.8.0_111/bin:/opt/jdk1.8.0_111/jre/bin" >> /etc/bashrc



source /etc/bashrc
clear 
figlet  -f small "Done, all good? check" 

# Show stuff
echo -e "\n\n Java Version:"
java -version

echo -e "\n\n Javac Version:"
javac -version
