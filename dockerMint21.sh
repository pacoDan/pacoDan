#Primero, actualice su lista de paquetes existente:
sudo apt update
#A continuación, instale algunos paquetes de requisitos previos que permitan a apt usar paquetes a través de HTTPS:
sudo apt install apt-transport-https ca-certificates curl software-properties-common

#Luego, añada la clave de GPG para el repositorio oficial de Docker en su sistema:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#Agregue el repositorio de Docker a las fuentes de APT:
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

#A continuación, actualice el paquete de base de datos con los paquetes de Docker del repositorio recién agregado:
sudo apt update

#Asegúrese de estar a punto de realizar la instalación desde el repositorio de Docker en lugar del repositorio predeterminado de Ubuntu:
apt-cache policy docker-ce

#Por último, instale Docker:
sudo apt install docker-ce

#Con esto, Docker quedará instalado, el demonio se iniciará y el proceso se habilitará para ejecutarse en el inicio. Compruebe que funcione:
#sudo systemctl status docker
