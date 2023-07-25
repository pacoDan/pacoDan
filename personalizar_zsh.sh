#!/bin/bash

# Instalar zsh-syntax-highlighting
echo "Instalando zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Instalar zsh-autosuggestions
echo "Instalando zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Instalar fzf y responder automáticamente "y" a las preguntas
echo "Instalando fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && yes | ~/.fzf/install

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

echo "Se ha configurado correctamente el archivo ~/.zshrc con los plugins."

# Reiniciar la terminal
echo "Reiniciando la terminal..."
exec zsh
