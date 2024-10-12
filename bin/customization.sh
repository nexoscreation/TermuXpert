#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}===== Termux Customization Tool =====${RESET}"

# Function to install a package if it's not already installed
install_package() {
    if ! command -v $1 &> /dev/null; then
        echo "Installing $1..."
        pkg install -y $1
    else
        echo "$1 is already installed."
    fi
}

# Install Zsh and Oh My Zsh
install_package zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Install and configure Powerlevel10k theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
else
    echo "Powerlevel10k theme is already installed."
fi

# Install and configure syntax highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    sed -i 's/plugins=(.*)/plugins=(git zsh-syntax-highlighting)/' ~/.zshrc
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Configure Termux appearance
mkdir -p ~/.termux
echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" > ~/.termux/termux.properties

echo -e "${GREEN}Customization complete!${RESET}"
echo "Please restart Termux or run 'source ~/.zshrc' to apply changes."