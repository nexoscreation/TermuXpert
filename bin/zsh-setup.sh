#!/bin/bash

# NinjaOS Zsh Setup Script

# Install Zsh if not already installed
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing Zsh..."
    pkg install zsh
fi

# Set Zsh as the default shell
chsh -s $(which zsh)

# Copy the NinjaOS Zsh theme to the Zsh themes directory
mkdir -p $PREFIX/share/oh-my-zsh/custom/themes
cp themes/zsh/ninja-theme.zsh $PREFIX/share/oh-my-zsh/custom/themes/

# Copy the aliases file to the Zsh custom directory
cp config/aliases.sh $PREFIX/share/oh-my-zsh/custom/

# Source the Zsh configuration
source $HOME/.zshrc

echo "Zsh has been set up for NinjaOS. Restart your Termux session to apply changes."
