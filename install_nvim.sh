#!/bin/bash

# Clonar el repositorio de neovim
git clone https://github.com/neovim/neovim.git

# Ingresar al directorio neovim
cd neovim

# Cambiar a la rama release-0.9
git checkout release-0.9

# Compilar e instalar neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
