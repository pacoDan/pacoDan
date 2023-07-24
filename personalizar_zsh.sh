#!/bin/bash

# Instalar zsh-syntax-highlighting
echo "Instalando zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Comprobar si ya existe el plugin zsh-autosuggestions en el archivo ~/.zshrc
if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
    # Si no existe, lo agregamos a la lista de plugins
    echo "Agregando zsh-autosuggestions a la lista de plugins en ~/.zshrc..."
    sed -i '/^plugins=/ s/)$/ zsh-autosuggestions)/' ~/.zshrc
else
    echo "El plugin zsh-autosuggestions ya está configurado en ~/.zshrc."
fi

# Reiniciar la terminal
echo "Reiniciando la terminal..."
exec zsh
