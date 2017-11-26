#!/bin/bash

clear

COMPOSE_VERSION=1.17.0

if [ "$USER" != "ubuntu" ]; then
  echo "Please run as ubuntu"
  exit
else
  echo "Installer: running as ubuntu"
  echo 'Installing: Docker CE'

  echo "Installer: Updating APT package Index"
  sudo apt-get update

  echo "Installer: Pre-requisites for repository over https"
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

  echo "Installer: Add Docker’s official GPG key"
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  echo "Installer: Add Stable repository"
  sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
  
  echo "Installer: refresh apt package list"
  sudo apt-get update

  echo "Installer: Install latest stable version of Docker CE"
  sudo apt-get install docker-ce -y

  echo "Installer: add docker user to group"
  sudo groupadd docker

  echo "Installer: add current user to docker group"
  sudo usermod -aG docker $USER

  echo "Installer: Installing Docker-Compose"
  sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose

fi

exit
