#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Uninstall Script

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

# Clear screen and print header
clear
print_color "$BLUE" "================================"
print_color "$YELLOW" "    TermuXpert Uninstaller"
print_color "$BLUE" "================================"

# Load configuration
if [ -f "$HOME/.termuxpert_config" ]; then
    source "$HOME/.termuxpert_config"
else
    print_color "$RED" "Error: TermuXpert configuration file not found."
    exit 1
fi

# Check if TermuXpert is installed
if [ ! -d "$INSTALL_DIR" ]; then
    print_color "$RED" "Error: TermuXpert is not installed."
    exit 1
fi

# Confirm uninstallation
print_color "$YELLOW" "Are you sure you want to uninstall TermuXpert? (y/N)"
read -r confirm
if [[ $confirm != [yY] && $confirm != [yY][eE][sS] ]]; then
    print_color "$YELLOW" "Uninstallation cancelled."
    exit 0
fi

# Remove symlink
print_color "$YELLOW" "Removing symlink..."
rm -f "$PREFIX/bin/termuxpert" || { print_color "$RED" "Failed to remove symlink. Continuing..."; }

# Remove installation directory
print_color "$YELLOW" "Removing TermuXpert directory..."
rm -rf "$INSTALL_DIR" || { print_color "$RED" "Failed to remove TermuXpert directory. Continuing..."; }

# Remove configuration file
print_color "$YELLOW" "Removing configuration file..."
rm -f "$HOME/.termuxpert_config" || { print_color "$RED" "Failed to remove configuration file. Continuing..."; }

print_color "$GREEN" "TermuXpert has been successfully uninstalled."
print_color "$YELLOW" "Thank you for using TermuXpert!"