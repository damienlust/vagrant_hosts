#!/usr/bin/env bash


yum install -y java

export DOCKERURL=https://storebits.docker.com/ee/power/sub-36fd119e-a029-4cdb-b17a-99b22f24bf26
sudo -E sh -c 'echo "$DOCKERURL/rhel" > /etc/yum/vars/dockerurl'
sudo sh -c 'echo "7" > /etc/yum/vars/dockerosversion'

yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --enable rhel-7-server-extras-rpms

yum-config-manager --add-repo "$DOCKERURL/rhel/docker-ee.repo"

yum -y install docker-ee

systemctl start docker

docker run hello-world
