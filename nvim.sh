#!/bin/bash

# Definir la URL del repositorio de Neovim
#repo_url="https://github.com/neovim/neovim"

# Obtener la URL del archivo de lanzamiento del último release
#release_url=$(curl -sL "$repo_url/releases/latest" | grep -o -E 'https://github\.com/neovim/neovim/releases/download/[^"]+' | head -n 1)
release_url="https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz"
# Obtener el nombre del archivo del último release
filename=$(basename "$release_url")

# Descargar el archivo del último release
echo "Descargando $filename..."
#curl -L -o "$filename" "$release_url"
wget $release_url
tar -xf nvim-linux64.tar.gz
mv ./nvim-linux $HOME
#echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.zshrc
#echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.zshrc
echo 'export PATH=$PATH:$HOME/nvim-linux64/bin' >> ~/.zshrc
echo "Instalacion  completada: $filename"
