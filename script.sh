#!/bin/bash

# Instalar Zsh
sudo apt-get update -y
sudo apt-get install -y zsh
sudo apt install -y --yes gcc make cmake xsel wl-clipboard ripgrep unzip

sudo apt install -y git

# Cambiar la shell actual a Zsh
chsh -s $(which zsh)

# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Cambiar el tema de Oh My Zsh a Powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' $HOME/.zshrc

# Reiniciar la shell
exec zsh
