#!/bin/bash

# Step 1 — Installing Docker

# Update your existing list of packages
sudo apt update

# Install a few prerequisite packages which let apt use packages over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add the GPG key for the official Docker repository to your system
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package database with the Docker packages from the newly added repo
sudo apt update

# Make sure you are about to install from the Docker repo instead of the default Ubuntu repo
apt-cache policy docker-ce

# Finally, install Docker
sudo apt install -y docker-ce

# Check that Docker is running
sudo systemctl status docker

# Step 2 — Executing the Docker Command Without Sudo (Optional)

# Add your user to the docker group
sudo usermod -aG docker ${USER}

# Apply the new group membership
su - ${USER}

# Confirm that your user is now added to the docker group
groups
