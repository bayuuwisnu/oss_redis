#!/bin/bash
#Update Docker Package Database
sudo yum check-update

#Install the Dependencies
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

#Add the Docker Repository to CentOS
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Install Docker On CentOS Using Yum
sudo yum install docker

#Start the Docker
sudo systemctl status docker