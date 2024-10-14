#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Installation Script

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Clear screen and print header
clear
print_color "$BLUE" "================================"
print_color "$YELLOW" "     TermuXpert Installer"
print_color "$BLUE" "================================"

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    print_color "$RED" "Error: This script must be run in Termux."
    exit 1
fi

# Define installation directory
INSTALL_DIR="$HOME/termuxpert"

# Check if TermuXpert is already installed
if [ -d "$INSTALL_DIR" ]; then
    print_color "$RED" "TermuXpert is already installed."
    print_color "$YELLOW" "To update, run ./update.sh"
    exit 1
fi

# Create TermuXpert directory
print_color "$YELLOW" "Creating TermuXpert directory..."
mkdir -p "$INSTALL_DIR" || { print_color "$RED" "Failed to create directory. Exiting."; exit 1; }

# Clone the repository
print_color "$YELLOW" "Cloning TermuXpert repository..."
if command_exists git; then
    git clone https://github.com/nexoscreation/TermuXpert.git "$INSTALL_DIR" || { print_color "$RED" "Failed to clone repository. Exiting."; exit 1; }
else
    print_color "$RED" "Git is not installed. Installing git..."
    pkg install -y git || { print_color "$RED" "Failed to install git. Exiting."; exit 1; }
    git clone https://github.com/nexoscreation/TermuXpert.git "$INSTALL_DIR" || { print_color "$RED" "Failed to clone repository. Exiting."; exit 1; }
fi

# Set permissions
print_color "$YELLOW" "Setting permissions..."
chmod +x "$INSTALL_DIR/bin"/*.sh "$INSTALL_DIR"/*.sh || { print_color "$RED" "Failed to set permissions. Exiting."; exit 1; }

# Create symlink
print_color "$YELLOW" "Creating symlink..."
ln -s "$INSTALL_DIR/bin/termuxpert.sh" "$PREFIX/bin/termuxpert" || { print_color "$RED" "Failed to create symlink. Exiting."; exit 1; }

# Install dependencies
print_color "$YELLOW" "Installing dependencies..."
pkg update -y || { print_color "$RED" "Failed to update package lists. Exiting."; exit 1; }
pkg install -y curl wget jq || { print_color "$RED" "Failed to install dependencies. Exiting."; exit 1; }

# Create configuration file
print_color "$YELLOW" "Creating configuration file..."
echo "INSTALL_DIR=$INSTALL_DIR" > "$HOME/.termuxpert_config"

print_color "$GREEN" "TermuXpert has been successfully installed!"
print_color "$YELLOW" "You can now run 'termuxpert' from anywhere to start the tool."