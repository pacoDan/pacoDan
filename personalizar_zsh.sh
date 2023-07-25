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
plugins_line="plugins=("
if ! grep -q "$plugins_line" ~/.zshrc; then
    echo "$plugins_line" >> ~/.zshrc
fi

plugins_to_add=(
    "git"
    "zsh-syntax-highlighting"
    "zsh-autosuggestions"
)

for plugin in "${plugins_to_add[@]}"; do
    if ! grep -q "$plugin" ~/.zshrc; then
        sed -i "s/\(plugins=([^)]*\))/\1 $plugin/" ~/.zshrc
    fi
done

echo ")" >> ~/.zshrc

# Reiniciar la terminal
echo "Reiniciando la terminal..."
exec zsh
