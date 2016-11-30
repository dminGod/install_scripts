# Install common stuff
echo -e "\n\n Installing common stuff.."
yum install -y iproute openssh-* initscripts vim wget curl lynx telnet nc

cd /opt

echo -e "\n\n Get Java and extract it... \n\n"
# Get Java tar gz :
wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz jdk-8u111-linux-x64.tar.gz

# extract it..
tar -zxvf jdk-8u111-linux-x64.tar.gz

cd jdk1.8.0_111

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

echo "export JAVA_HOME=/opt/jdk1.8.0_111" >> /etc/environment
echo "export JRE_HOME=/opt/jdk1.8.0_111/jre" >> /etc/environment
echo "export PATH=\$PATH:/opt/jdk1.8.0_111/bin:/opt/jdk1.8.0_111/jre/bin" >> /etc/environment

# Show stuff
echo -e "\n\n Java Version:"
java -version

echo -e "\n\n Javac Version:"
javac -version
