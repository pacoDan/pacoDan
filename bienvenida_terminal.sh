#!/bin/bash

# Ruta del archivo .zshrc
zshrc_file=~/.zshrc

# URL del archivo con el arte ASCII del mensaje de bienvenida
welcome_ascii_url="https://raw.githubusercontent.com/pacodan/pacodan/main/ascii_bienvenida.txt"

# Descargar el archivo welcome_ascii.txt
wget -O /tmp/welcome_ascii.txt "$welcome_ascii_url"

# Verificar si la descarga del archivo fue exitosa
if [ $? -ne 0 ]; then
  echo "ERROR: No se pudo descargar el archivo welcome_ascii.txt. Verifica la URL y tu conexión a Internet."
  exit 1
fi

# Verificar si el arte ASCII ya existe en el archivo .zshrc
if grep -q "$welcome_ascii_url" "$zshrc_file"; then
  echo "Mensaje de bienvenida ya existe en el archivo .zshrc. No se agregará nuevamente."
else
  # Eliminar el arte ASCII anterior (si existe)
  sed -i '/^# Mensaje de bienvenida personalizado.*/,/^# Fin del mensaje de bienvenida personalizado./d' "$zshrc_file"

  # Agregar el arte ASCII al archivo .zshrc
  echo "# Mensaje de bienvenida personalizado." >> "$zshrc_file"
  cat /tmp/welcome_ascii.txt >> "$zshrc_file"
  echo "# Fin del mensaje de bienvenida personalizado." >> "$zshrc_file"

  echo "Mensaje de bienvenida personalizado agregado al archivo .zshrc!"
fi

# Eliminar el archivo temporal
rm /tmp/welcome_ascii.txt
