#!/bin/bash

# Update existing list of packages
sudo apt update

# Install prerequisite packages
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Add GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update existing list of packages again
sudo apt update

# Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Check Docker version
sudo docker version

# Check Docker installation with hello-world
sudo docker run hello-world
