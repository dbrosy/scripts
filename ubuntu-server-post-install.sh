#!/bin/bash

set -e


# echo "$USER ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# Add Ubiquiti stable repository
sudo add-apt-repository "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti"
sudo add-apt-repository "deb http://www.ubnt.com/downloads/unifi/debian testing ubiquiti"

# Add Ubiquiti testing repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50

# Update package information
sudo apt-get update

# Install unifi controller
sudo apt-get install unifi
