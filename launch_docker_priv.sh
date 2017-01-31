function help() {

	echo "Usage: $0 <image-id / image-name> <new name for container>"
}

if [ $# -lt 2 ]
then
	help
	exit 1
fi
image_id=$1
docker run -it -d --privileged -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup  $image_id /sbin/init

sleep 2

containername=`docker ps -a | head -2 | tail -1 | gawk '{print $10}'`
replacewithname=$2

docker rename $containername $replacewithname
