#!/bin/bash

# URL del archivo con el arte ASCII del mensaje de bienvenida
welcome_ascii_url="https://raw.githubusercontent.com/pacodan/pacodan/main/ascii_bienvenida.txt"

# Descargar el archivo welcome_ascii.txt
wget -O "$HOME/welcome_ascii.txt" "$welcome_ascii_url"

# Verificar si la descarga del archivo fue exitosa
if [ $? -ne 0 ]; then
  echo "ERROR: No se pudo descargar el archivo welcome_ascii.txt. Verifica la URL y tu conexión a Internet."
  exit 1
fi

# Agregar el comando para mostrar el arte ASCII al inicio del archivo .zshrc
echo "cat ~/welcome_ascii.txt" >> ~/.zshrc

# Mostrar el arte ASCII en la terminal actual
cat ~/welcome_ascii.txt

echo "Mensaje de bienvenida personalizado agregado a la terminal y se mostrará cada vez que abras una nueva sesión de terminal!"
