#!/usr/bin/env bash

yum install -y git
yum install -y java

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

yum install -y jenkins
yum install -y docker
systemctl start jenkins
systemctl start docker
