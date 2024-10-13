#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}TermuXpert Updater${RESET}"

# Check if TermuXpert is installed
INSTALL_DIR="$HOME/termuxpert"
if [ ! -d "$INSTALL_DIR" ]; then
    echo -e "${RED}Error: TermuXpert is not installed.${RESET}"
    echo "Please run ./install.sh first."
    exit 1
fi

# Navigate to the installation directory
cd "$INSTALL_DIR"

# Fetch the latest changes
echo "Fetching the latest changes..."
git fetch origin

# Check if there are any updates
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL = $REMOTE ]; then
    echo -e "${GREEN}TermuXpert is already up to date.${RESET}"
    exit 0
fi

# Perform the update
echo "Updating TermuXpert..."
git pull origin main

# Make sure all scripts are executable
echo "Updating permissions..."
chmod +x bin/*.sh
chmod +x *.sh

# Update dependencies
echo "Updating dependencies..."
pkg update -y
pkg upgrade -y

echo -e "${GREEN}TermuXpert has been successfully updated!${RESET}"