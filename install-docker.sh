#!/usr/bin/env bash
set -o nounset
set -o errexit
set -o pipefail

clear

# COMPOSE_VERSION=1.23.2

if [ "$USER" != "ubuntu" ]; then
  echo "Please run as ubuntu"
  exit
else
  echo "Installer: running as ubuntu"
  echo 'Installing: Docker CE'

  echo "Installer: Updating APT package Index"
  sudo apt-get update

  echo "Installer: Pre-requisites for repository over https"
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
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
  sudo apt-get -y install docker-ce docker-ce-cli containerd.io

  echo "Installer: add current user to docker group"
  if grep -q docker /etc/group
    then
         echo "group exists - skipping"
    else
         sudo groupadd docker
    fi
  
  sudo usermod -aG docker $USER

  echo "Installer: Installing Docker-Compose"
  COMPOSE_VERSION=`git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oP "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 |tail -n 1`
  sudo sh -c "curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
  sudo chmod +x /usr/local/bin/docker-compose
  sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
  clear
  docker -v
  docker-compose -v
fi

exit
