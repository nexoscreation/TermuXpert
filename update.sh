#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Update Script

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
print_color "$YELLOW" "      TermuXpert Updater"
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
    print_color "$YELLOW" "Please run ./install.sh first."
    exit 1
fi

# Navigate to the installation directory
cd "$INSTALL_DIR" || { print_color "$RED" "Failed to change directory. Exiting."; exit 1; }

# Fetch the latest changes
print_color "$YELLOW" "Fetching the latest changes..."
git fetch origin || { print_color "$RED" "Failed to fetch updates. Exiting."; exit 1; }

# Check if there are any updates
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" = "$REMOTE" ]; then
    print_color "$GREEN" "TermuXpert is already up to date."
    exit 0
fi

# Perform the update
print_color "$YELLOW" "Updating TermuXpert..."
git pull origin main || { print_color "$RED" "Failed to pull updates. Exiting."; exit 1; }

# Update permissions
print_color "$YELLOW" "Updating permissions..."
chmod +x bin/*.sh *.sh || { print_color "$RED" "Failed to update permissions. Exiting."; exit 1; }

# Update dependencies
print_color "$YELLOW" "Updating dependencies..."
pkg update -y || { print_color "$RED" "Failed to update package lists. Exiting."; exit 1; }
pkg upgrade -y || { print_color "$RED" "Failed to upgrade packages. Exiting."; exit 1; }

print_color "$GREEN" "TermuXpert has been successfully updated!"
print_color "$YELLOW" "Please restart TermuXpert to use the latest version."