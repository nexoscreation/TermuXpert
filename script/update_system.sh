#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}TermuXpert System Update Script${RESET}"

# Update package lists
echo -e "${GREEN}Updating package lists...${RESET}"
pkg update -y

# Upgrade installed packages
echo -e "${GREEN}Upgrading installed packages...${RESET}"
pkg upgrade -y

# Clean package cache
echo -e "${GREEN}Cleaning package cache...${RESET}"
pkg clean

# Update pip packages
if command -v pip &> /dev/null; then
    echo -e "${GREEN}Updating pip packages...${RESET}"
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
fi

# Update npm packages
if command -v npm &> /dev/null; then
    echo -e "${GREEN}Updating npm packages...${RESET}"
    npm update -g
fi

# Update Termux-tools
if [ -d "$HOME/termux-tools" ]; then
    echo -e "${GREEN}Updating Termux-tools...${RESET}"
    cd "$HOME/termux-tools" && git pull
fi

echo -e "${GREEN}System update completed successfully!${RESET}"