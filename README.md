
I use this as a common java installer script. it also installs commonly used utilities that I need. aimed at centos 7. I use it with new docker containers most of the time.

Instructions I used for the for the install can be found [here](http://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/)

##Install Stuff
This script installs basic utilities : 
- iproute
- openssh-* 
- initscripts 
- vim 
- wget 
- curl 
- telnet 
- nc 
- lynx


##Setup Java
- The download and extract happens in the /opt directory
- Adds the setup details to alternatives
- Sets up the environment variables.


