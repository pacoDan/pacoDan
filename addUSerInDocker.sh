#Si desea evitar escribir sudo al ejecutar el comando docker, agregue su nombre de usuario al grupo docker:
sudo usermod -aG docker ${USER}
#Para aplicar la nueva membresía de grupo, cierre la sesión del servidor y vuelva a iniciarla o escriba lo siguiente:
su - ${USER}
#Para continuar, se le solicitará ingresar la contraseña de su usuario.

#Confirme que ahora su usuario se agregó al grupo docker escribiendo lo siguiente:
id -nG
#Output
#sammy sudo docker
#Si debe agregar al grupo docker un usuario con el que no inició sesión, declare dicho nombre de usuario de forma explícita usando lo siguiente:
sudo usermod -aG docker ${USER}
