#!/bin/bash
sudo yum -y install docker
sudo yum install -y docker.io
systemctl start docker
sudo docker pull jpas01/repocloud:webapp-bluev1
sudo docker run -d -p 80:80 --memory=128m --name webappblue jpas01/repocloud:webapp-bluev1