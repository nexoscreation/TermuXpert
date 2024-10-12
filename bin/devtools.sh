#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}===== Termux Development Tools Installer =====${RESET}"

# Function to install a package if it's not already installed
install_package() {
    if ! command -v $1 &> /dev/null; then
        echo "Installing $1..."
        pkg install -y $1
    else
        echo "$1 is already installed."
    fi
}

# List of development tools to install
dev_tools=(
    "git"
    "python"
    "nodejs"
    "vim"
    "nano"
    "gcc"
    "clang"
    "make"
    "wget"
    "curl"
)

# Install development tools
for tool in "${dev_tools[@]}"; do
    install_package $tool
done

# Configure Git
if [ ! -f "$HOME/.gitconfig" ]; then
    echo "Configuring Git..."
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    git config --global color.ui auto
else
    echo "Git is already configured."
fi

# Install pip for Python
if ! command -v pip &> /dev/null; then
    echo "Installing pip..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
    rm get-pip.py
else
    echo "pip is already installed."
fi

# Install some global npm packages
echo "Installing global npm packages..."
npm install -g yarn typescript eslint

echo -e "${GREEN}Development tools installation complete!${RESET}"
echo "You now have the following tools available:"
for tool in "${dev_tools[@]}"; do
    echo "- $tool"
done
echo "As well as pip for Python and some global npm packages."