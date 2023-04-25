#!/bin/bash

# Import Microsoft GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register Microsoft Ubuntu repository
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

# Update sources list and install mssql-tools with unixODBC developer package
sudo apt-get update
sudo apt-get install mssql-tools unixodbc-dev -y

# Add mssql-tools to PATH environment variable for bash shell
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc

# Verify installation
sqlcmd -v




# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register the Microsoft Ubuntu repository
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod

# Update the list of products
sudo apt-get update

# Install mssql-cli
sudo apt-get install mssql-cli

# Install missing dependencies
sudo apt-get install -f

sudo /opt/mssql/bin/mssql-conf setup
