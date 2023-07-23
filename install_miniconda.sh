#!/bin/bash

# Descargar el script de instalación de Miniconda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

# Dar permisos de ejecución al script
chmod +x Miniconda3-latest-Linux-x86_64.sh

# Ejecutar el script de instalación de Miniconda
./Miniconda3-latest-Linux-x86_64.sh

# Eliminar el archivo de instalación después de la instalación
rm Miniconda3-latest-Linux-x86_64.sh
