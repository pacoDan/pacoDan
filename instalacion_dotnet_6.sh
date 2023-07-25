#!/bin/bash

# Descargar e instalar .NET 6
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
chmod +x ./dotnet-install.sh
./dotnet-install.sh --channel 6.0

# Definir las variables de entorno
echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.zshrc
echo 'export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools' >> ~/.zshrc

# Recargar el archivo .zshrc
source ~/.zshrc

# Limpiar el archivo de instalación
rm dotnet-install.sh

echo ".NET 6 instalado y configurado correctamente."
