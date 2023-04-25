#!/bin/bash

# Update existing list of packages
sudo apt update

# Install prerequisite packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Update existing list of packages again
sudo apt update

# Install Docker
sudo apt install -y docker-ce

# Check Docker version
sudo docker version

# Check Docker installation with hello-world
sudo docker run hello-world
