
I use for common installation scripts to automate installations. Currently all tools are aimed at centos 7. I use it with new docker containers most of the time.

#Install Java - install_java.sh
Instructions I used for the for the install can be found [here](http://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/)

This does 2 things : 
- Install common utilities (iproute, openssh, initscripts, vim, wget, curl, telnet, nc, lynx)
- Install Oracle Java 8.1.0_111

#Install Cassandra - install_cassandra.sh
As the name suggests, it downloads Apache Cassandra 2.1.8 in tar.gz and installs it

