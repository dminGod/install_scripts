# shell script to install cassandra
# Version 3.9

function help() {

        echo "Usage : "$0" <install-directory> <comma-separated-seeds>"
        exit 1;
}


if [ $# -lt 2 ]
then
        help
fi

# get required variables ready
target_directory=$1
seeds=$2
# identify the network interface
#if=$(ip r | head -1 | awk '{print $5}')

# get the ip
#ip=$(ip r | grep $if | tail -1 | awk '{print $(NF-2)}')
ip=$(hostname -i)
cd $target_directory


# fetch and extract cassandra tar.gz
wget http://redrockdigimark.com/apachemirror/cassandra/3.9/apache-cassandra-3.9-bin.tar.gz
tar -zxvf apache-cassandra-3.9-bin.tar.gz

# go to the directory
cd apache-cassandra-3.9

# Edit the cassandra.yaml file
sed -i -r "s/(listen_address:)(.*)/\1 $ip/" conf/cassandra.yaml
sed -i -r "s/(rpc_address:)(.*)/\1 $ip/" conf/cassandra.yaml
sed -i -r "s/(start_rpc:)(.*)/\1 true/" conf/cassandra.yaml
sed -i -r "s/(seeds:)(.*)/\1 \"$seeds\"/" conf/cassandra.yaml

echo -e "Installation [\e[32m OK \e[0m]"