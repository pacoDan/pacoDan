#!/bin/bash

# Actualiza la lista de paquetes
sudo apt update

# Instala net-tools si aún no está instalado
sudo apt install -y net-tools

# Comprueba si SQL Server está escuchando en el puerto 1433
netstat -plnt | grep 1433

# Si no ves una línea que diga que SQL Server está escuchando en el puerto 1433, 
# es posible que necesites reconfigurar SQL Server para escuchar en ese puerto.

# Instala ufw si aún no está instalado
sudo apt install -y ufw

# Permite las conexiones al puerto 1433
sudo ufw allow to any port 1433 proto tcp

# Activa ufw si aún no está activado
sudo ufw enable

# Verifica el estado de ufw para asegurarte de que la regla se ha aplicado correctamente
sudo ufw status
