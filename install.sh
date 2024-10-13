#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Installation Script

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}TermuXpert Installer${RESET}"

# Check if Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo -e "${RED}Error: This script must be run in Termux.${RESET}"
    exit 1
fi

# Create TermuXpert directory
INSTALL_DIR="$HOME/termuxpert"
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${RED}TermuXpert is already installed.${RESET}"
    echo "To update, run ./update.sh"
    exit 1
fi

echo "Creating TermuXpert directory..."
mkdir -p "$INSTALL_DIR"

# Clone the repository
echo "Cloning TermuXpert repository..."
git clone https://github.com/nexoscreation/TermuXpert.git "$INSTALL_DIR"

# Make scripts executable
echo "Setting permissions..."
chmod +x "$INSTALL_DIR/bin"/*.sh
chmod +x "$INSTALL_DIR"/*.sh

# Create symlink
echo "Creating symlink..."
ln -s "$INSTALL_DIR/bin/termuxpert.sh" "$PREFIX/bin/termuxpert"

# Install dependencies
echo "Installing dependencies..."
pkg update -y
pkg install -y git curl wget jq

echo -e "${GREEN}TermuXpert has been successfully installed!${RESET}"
echo "You can now run 'termuxpert' from anywhere to start the tool."