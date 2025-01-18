#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Update Script
# Version: 1.0.0
# Description: Updates TermuXpert to the latest version with enhanced error handling

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

# Header Display
clear
print_color "$BLUE" "========================================="
print_color "$YELLOW" "         TermuXpert Updater v1.0.0       "
print_color "$BLUE" "========================================="

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
    print_color "$YELLOW" "Please run the installation script first."
    exit 1
fi

# Navigate to the installation directory
cd "$INSTALL_DIR" || { print_color "$RED" "Failed to change directory to $INSTALL_DIR. Exiting."; exit 1; }

# Check for Git availability
if ! command -v git &>/dev/null; then
    print_color "$RED" "Error: Git is not installed."
    print_color "$YELLOW" "Install Git using: pkg install git"
    exit 1
fi

# Check for updates
print_color "$YELLOW" "Checking for updates..."
git fetch origin || { print_color "$RED" "Failed to fetch updates. Exiting."; exit 1; }

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" = "$REMOTE" ]; then
    print_color "$GREEN" "TermuXpert is already up to date."
    exit 0
fi

# Backup current version
BACKUP_DIR="$HOME/termuxpert_backup_$(date +%Y%m%d_%H%M%S)"
print_color "$YELLOW" "Creating a backup of the current version..."
mkdir -p "$BACKUP_DIR"
cp -r ./* "$BACKUP_DIR" || { print_color "$RED" "Failed to create backup. Exiting."; exit 1; }
print_color "$GREEN" "Backup created successfully at $BACKUP_DIR"

# Perform the update
print_color "$YELLOW" "Updating TermuXpert to the latest version..."
git pull origin main || { print_color "$RED" "Failed to pull updates. Exiting."; exit 1; }

# Update permissions
print_color "$YELLOW" "Updating permissions..."
chmod +x bin/*.sh *.sh || { print_color "$RED" "Failed to update permissions. Exiting."; exit 1; }

# Update dependencies
print_color "$YELLOW" "Updating dependencies..."
pkg update -y || { print_color "$RED" "Failed to update package lists. Exiting."; exit 1; }
pkg upgrade -y || { print_color "$RED" "Failed to upgrade packages. Exiting."; exit 1; }

# Post-update checklist
print_color "$YELLOW" "Performing post-update checks..."
if [ ! -f "$PREFIX/bin/termuxpert" ]; then
    ln -sf "$INSTALL_DIR/bin/termuxpert.sh" "$PREFIX/bin/termuxpert"
    print_color "$GREEN" "Symlink recreated successfully."
else
    print_color "$GREEN" "Symlink is intact."
fi

print_color "$GREEN" "TermuXpert has been successfully updated!"
print_color "$YELLOW" "Please restart TermuXpert to use the latest version."