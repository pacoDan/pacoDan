#!/bin/bash

# Actualiza los repositorios
sudo apt update

# Instala los paquetes deseados
sudo apt install htop neofetch net-tools git curl gcc make -y

# Instala nodejs
sudo curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instala npm
sudo apt-get install -y npm

# Muestra la información del sistema con neofetch
neofetch
