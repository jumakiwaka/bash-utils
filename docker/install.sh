#! /bin/bash

# script to install docker and docker-compose on Ubuntu 18.04 x64
# update dependencies
sudo apt-get update

# remove old versions of docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# set up docker repo env
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - # add docker gpg

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# INSTALL DOCKER ENGINE

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# INSTALL LATEST STABLE DOCKER-COMPOSE
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# ADD EXECUTE PERMISSIONS TO docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# CONFIRM INSTALLATION
docker -v

docker-compose -v
