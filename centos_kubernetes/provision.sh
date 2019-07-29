#!/usr/bin/env bash


yum install -y java

export DOCKERURL=https://storebits.docker.com/ee/power/sub-36fd119e-a029-4cdb-b17a-99b22f24bf26
sudo -E sh -c 'echo "$DOCKERURL/rhel" > /etc/yum/vars/dockerurl'
sudo sh -c 'echo "7" > /etc/yum/vars/dockerosversion'

yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --enable rhel-7-server-extras-rpms

yum-config-manager --add-repo "$DOCKERURL/rhel/docker-ee.repo"

echo '[kubernetes]' >> /etc/yum.repos.d/k8s.repo
echo 'name=Kubernetes' >> /etc/yum.repos.d/k8s.repo
echo 'baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64' >> /etc/yum.repos.d/k8s.repo
echo 'enabled=1' >> /etc/yum.repos.d/k8s.repo
echo 'gpgcheck=1' >> /etc/yum.repos.d/k8s.repo
echo 'repo_gpgcheck=1' >> /etc/yum.repos.d/k8s.repo
echo 'gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg' >> /etc/yum.repos.d/k8s.repo
echo '        https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg' >> /etc/yum.repos.d/k8s.repo

echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
sudo swapoff -a 

yum -y install docker-ee

yum -y install kubeadm

systemctl start docker

systemctl  restart kubelet && systemctl enable kubelet

docker run hello-world
