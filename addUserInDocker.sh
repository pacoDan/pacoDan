#!/bin/bash

# Agregar el usuario al grupo docker
sudo usermod -aG docker ${USER}

# Cerrar y volver a iniciar sesión
su - ${USER}

# Confirmar la membresía del grupo docker
echo "El usuario ${USER} ahora pertenece a los grupos:"
id -nG
