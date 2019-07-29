#!/usr/bin/env bash

yum install -y git
yum install -y java

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

yum install -y jenkins
yum install -y docker
usermod -aG dockerroot jenkins
echo "{" >>  /etc/docker/daemon.json

echo '"live-restore": true,' >> /etc/docker/daemon.json
echo '"group": "dockerroot"' >>  /etc/docker/daemon.json
echo "}" >>  /etc/docker/daemon.json

systemctl start jenkins
systemctl start docker

