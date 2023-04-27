#!/bin/bash

# Instalar snap
sudo apt update
sudo apt install snapd

# Configurar soft links para snapd
sudo ln -s /var/lib/snapd/snap /snap

# Instalar paquetes
sudo apt install htop neofetch net-tools git curl gcc make

# Instalar Node.js
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instalar hello-world
sudo snap install hello-world

# Instalación completada
echo "¡Instalación completada con éxito!"
