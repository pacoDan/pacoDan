#!/bin/bash

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install fzf with automatic confirmations
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --key-bindings --no-update-rc

# Update the zshrc file with the desired plugins
if ! grep -q "plugins=(" ~/.zshrc; then
  sed -i '/^plugins=(/a \ \ zsh-autosuggestions\n)' ~/.zshrc
fi

echo "Plugin zsh-autosuggestions has been installed and added to your ~/.zshrc file."
echo "FZF has been installed with automatic confirmations."
echo "Please restart your shell for the changes to take effect."
