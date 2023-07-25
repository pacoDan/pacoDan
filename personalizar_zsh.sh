#!/bin/bash

# Instalar zsh-syntax-highlighting
echo "Instalando zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Instalar zsh-autosuggestions
echo "Instalando zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

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

# Asegurarse de que esté presente la línea 'source $ZSH/oh-my-zsh.sh'
if ! grep -q "source $ZSH/oh-my-zsh.sh" ~/.zshrc; then
    echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc
fi

