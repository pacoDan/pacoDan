#!/bin/bash

# Install zsh-autosuggestions if not already installed
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# Install fzf if not already installed
if [ ! -d ~/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all --key-bindings --no-update-rc
fi

# Update the zshrc file with the desired plugins
if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
  sed -i '/^plugins=(/ s/)$/ zsh-autosuggestions)/' ~/.zshrc
fi

echo "Plugin zsh-autosuggestions has been installed and added to your ~/.zshrc file."
echo "FZF has been installed with automatic confirmations."
echo "Please restart your shell for the changes to take effect."
