#!/bin/bash

# Instalar zsh-syntax-highlighting si no está instalado
echo "Instalando zsh-syntax-highlighting..."
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Instalar zsh-autosuggestions si no está instalado
echo "Instalando zsh-autosuggestions..."
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Configurar plugins en ~/.zshrc
echo "Configurando plugins en ~/.zshrc..."
plugins_line="plugins=(git zsh-syntax-highlighting zsh-autosuggestions)"
if ! grep -q "$plugins_line" ~/.zshrc; then
    echo "$plugins_line" >> ~/.zshrc
fi

# Reiniciar la terminal
echo "Reiniciando la terminal..."
exec zsh
