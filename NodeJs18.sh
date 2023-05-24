#!/bin/bash

# Descargar Node.js v18
wget https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz

# Descomprimir el archivo descargado
tar -xf node-v18.16.0-linux-x64.tar.xz

# Mover la carpeta descomprimida a ~/node18
mv node-v18.16.0-linux-x64 ~/node18

# Agregar el directorio al PATH en el archivo .zshrc
echo 'export PATH=$PATH:~/node18/bin' >> ~/.zshrc

# Actualizar el PATH en la sesión actual
source ~/.zshrc

# Imprimir la versión de Node.js instalada
node_version=$(node -v)
echo "Node.js v18 se ha instalado y configurado correctamente. Versión: $node_version"

# Eliminar el archivo comprimido descargado
rm node-v18.16.0-linux-x64.tar.xz
