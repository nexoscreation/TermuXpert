#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo -e "${YELLOW}===== Termux Backup Tool =====${RESET}"

# Set backup directory
BACKUP_DIR="$HOME/termux_backups"
BACKUP_FILE="termux_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

echo "Creating backup..."

# Create tar archive of important directories
tar -czf "$BACKUP_DIR/$BACKUP_FILE" \
    -C "$HOME" \
    --exclude="./storage" \
    --exclude="./downloads" \
    .termux \
    .bash_history \
    .bash_profile \
    .bashrc \
    .gitconfig \
    .ssh \
    bin

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Backup created successfully: $BACKUP_DIR/$BACKUP_FILE${RESET}"
    echo "Backup size: $(du -h "$BACKUP_DIR/$BACKUP_FILE" | cut -f1)"
else
    echo "Backup failed. Please check for errors."
fi

# List installed packages
echo "Creating list of installed packages..."
pkg list-installed > "$BACKUP_DIR/installed_packages_$(date +%Y%m%d_%H%M%S).txt"

echo -e "${YELLOW}Backup process completed.${RESET}"