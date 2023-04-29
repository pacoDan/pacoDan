#!/bin/bash

# Agregar usuario al grupo docker
sudo usermod -aG docker ${USER}

# Cerrar sesión e iniciarla nuevamente
exec su -l ${USER}

# Confirmar membresía del grupo docker
id -nG
