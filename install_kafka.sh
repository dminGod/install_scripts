#!/bin/bash

# https://www.vultr.com/docs/how-to-install-apache-kafka-on-centos-7

cd /opt

clear
figlet -f small "Download Kafka"
# Get kafka
wget http://www-us.apache.org/dist/kafka/0.9.0.1/kafka_2.11-0.9.0.1.tgz

# Extract it
tar -zxvf kafka_2.11-0.9.0.1.tgz

# Rename folder
mv kafka_2.11-0.9.0.1 kafka

cd kafka

clear

figlet -f small "Start Zookeeper"

echo -e "\n\n"

# Start zookeeper service
echo -e "Starting Zookeeper server.. \n\n"
bin/zookeeper-server-start.sh -daemon config/zookeeper.properties

figlet -f small "Change stuff if you want..."

# Change the kafka settings if you want
echo -e "Change the memory allocation to kafka you want from \n vim bin/kafka-server-start.sh \n"
echo -e 'Change the line :  export KAFKA_HEAP_OPTS="-Xmx1G -Xms1G" \n\n'

read -p "Press any key to continue"

clear

figlet -f small 'Starting Kafka Server'

# Start Kafka Server 
bin/kafka-server-start.sh config/server.properties &


read -p "Press any key to continue"
clear

figlet -f small "Testing stuff"

echo -e " Making a test topic : \n bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test \n\n"

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test

echo -e " Check if test topic got added, you should be able to see 'test'... running bin/kafka-topics.sh --list --zookeeper localhost:2181"
bin/kafka-topics.sh --list --zookeeper localhost:2181

echo -e "You can now produce messages with : \n bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test"
echo -e "To read those messages back you can use : \n bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic test --from-beginning"



