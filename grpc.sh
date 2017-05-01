# Install gRPC on Ubuntu

# Make sure you grab the latest version
curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip

# Unzip
unzip protoc-3.2.0-linux-x86_64.zip -d protoc3

# Move only protoc* to /usr/bin/
sudo mv protoc3/bin/protoc /usr/bin/protoc


sudo add-apt-repository ppa:ubuntu-lxc/lxd-stable
sudo apt-get update
sudo apt-get install golang

# Big Thankyou to : https://gist.github.com/sofyanhadia/37787e5ed098c97919b8c593f0ec44d8
# and http://stackoverflow.com/questions/17480044/how-to-install-the-current-version-of-go-in-ubuntu-precise
