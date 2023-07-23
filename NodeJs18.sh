#!/bin/zsh

# Directorio de destino para la instalación de Node.js
install_dir="$HOME/node18"

# Descargar Node.js v18.17.0 desde el sitio oficial en el directorio $HOME
cd $HOME
wget https://nodejs.org/dist/v18.17.0/node-v18.17.0-linux-x64.tar.xz

# Descomprimir el archivo descargado
tar -xf node-v18.17.0-linux-x64.tar.xz

# Mover la carpeta descomprimida a ~/node18
mv node-v18.17.0-linux-x64 $install_dir

# Agregar el directorio al PATH en el archivo .bashrc y .zshrc solo si no existe ya
if [[ ! ":$PATH:" == *":$install_dir/bin:"* ]]; then
    echo 'export PATH=$PATH:'$install_dir'/bin' >> $HOME/.bashrc
    echo 'export PATH=$PATH:'$install_dir'/bin' >> $HOME/.zshrc
fi

# Actualizar el PATH en la sesión actual
source $HOME/.bashrc
source $HOME/.zshrc

# Imprimir la versión de Node.js instalada
node_version=$(node -v)
echo "Node.js v18.17.0 se ha instalado y configurado correctamente. Versión: $node_version"

# Eliminar el archivo comprimido descargado
rm node-v18.17.0-linux-x64.tar.xz
