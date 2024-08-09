#!/bin/bash

# Ruta donde se clonará el repositorio temporalmente
TMP_DIR="/tmp/nvim"

# Eliminar el directorio temporal si ya existe
rm -rf $TMP_DIR

# Clonar el repositorio de Neovim desde la rama master
git clone --branch master https://github.com/neovim/neovim.git $TMP_DIR

# Entrar al directorio clonado
cd $TMP_DIR

# Compilar Neovim
make CMAKE_BUILD_TYPE=Release

# Instalar Neovim
make install

# Mover los binarios y archivos necesarios a /root/.desarrollo
mkdir -p /root/.desarrollo/nvim-master
cp -r build/* /root/.desarrollo/nvim-master/

# Crear un enlace simbólico en /usr/local/bin para que nvim esté en el PATH
ln -sf /root/.desarrollo/nvim-master/bin/nvim /usr/local/bin/nvim

# Limpiar el directorio temporal
rm -rf $TMP_DIR

echo "Neovim se ha instalado correctamente desde la rama master y está disponible en el PATH global."
