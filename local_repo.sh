#!/bin/bash

echo -n "IP of the HTTP repo server:"
read kk

cat <<EOF >/etc/yum.repos.d/local.repo
[LocalRepo]
name=LocalRepo
baseurl=http://$kk/rpms/common
gpgcheck=0
enabled=1
priority=1
EOF

yum clean all

yum repolist