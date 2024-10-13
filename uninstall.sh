#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}TermuXpert Uninstaller${RESET}"

# Check if TermuXpert is installed
INSTALL_DIR="$HOME/termuxpert"
if [ ! -d "$INSTALL_DIR" ]; then
    echo -e "${RED}Error: TermuXpert is not installed.${RESET}"
    exit 1
fi

# Confirm uninstallation
read -p "Are you sure you want to uninstall TermuXpert? (y/N) " confirm
if [[ $confirm != [yY] && $confirm != [yY][eE][sS] ]]; then
    echo "Uninstallation cancelled."
    exit 0
fi

# Remove symlink
echo "Removing symlink..."
rm -f "$PREFIX/bin/termuxpert"

# Remove installation directory
echo "Removing TermuXpert directory..."
rm -rf "$INSTALL_DIR"

# Remove any leftover configuration files
echo "Removing configuration files..."
rm -f "$HOME/.termuxpert_config"

echo -e "${GREEN}TermuXpert has been successfully uninstalled.${RESET}"
echo "Thank you for using TermuXpert!"