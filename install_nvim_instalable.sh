#!/bin/bash

# Directorio donde se instalará Neovim
INSTALL_DIR="/root/.desarrollo/nvim-latest"

# Crear el directorio de instalación si no existe
mkdir -p $INSTALL_DIR

# Obtener la URL del último release de Neovim desde GitHub
LATEST_RELEASE_URL=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep "browser_download_url.*nvim-linux64.tar.gz" | cut -d '"' -f 4)

# Verificar si se obtuvo una URL válida
if [ -z "$LATEST_RELEASE_URL" ]; then
    echo "Error: No se pudo obtener la URL del último release de Neovim."
    exit 1
fi

# Descargar el último release de Neovim
curl -L $LATEST_RELEASE_URL -o /tmp/nvim-linux64.tar.gz

# Extraer el contenido del tar.gz en el directorio de instalación
tar -xzvf /tmp/nvim-linux64.tar.gz -C $INSTALL_DIR --strip-components=1

# Crear un enlace simbólico en /usr/local/bin para que nvim esté en el PATH
ln -sf $INSTALL_DIR/bin/nvim /usr/local/bin/nvim

# Limpiar el archivo descargado
rm /tmp/nvim-linux64.tar.gz

echo "Neovim se ha instalado correctamente desde el último release y está disponible en el PATH."
