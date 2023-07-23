#!/bin/bash

# Función para manejar la entrada de contraseña para sudo
ingresar_contraseña_sudo() {
  sudo -Sv <<< "$1"
}

# Verificar si se necesita sudo probando si apt se puede actualizar sin contraseña
if sudo -n true; then
  # Si sudo no requiere una contraseña, actualizar sin solicitar contraseña
  sudo apt update -y
  sudo apt install -y --yes zsh gcc make cmake xsel wl-clipboard ripgrep unzip neofetch screenfetch gettext g++
else
  # Si sudo requiere una contraseña, solicitarla al principio
  read -sp "Ingresa tu contraseña de sudo: " contraseña_sudo
  echo "$contraseña_sudo" | ingresar_contraseña_sudo "$contraseña_sudo"
  sudo apt update -y
  echo "$contraseña_sudo" | ingresar_contraseña_sudo "$contraseña_sudo"
  sudo apt install -y --yes zsh gcc make cmake xsel wl-clipboard ripgrep unzip neofetch screenfetch gettext g++
fi

# Resto del script sigue igual
chsh -s "$(which zsh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' "$HOME/.zshrc"
exec zsh
