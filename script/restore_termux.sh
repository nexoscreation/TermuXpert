#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Function to run a command and check for errors
run_command() {
    if ! $1; then
        print_color "$RED" "Error: Failed to $2"
        exit 1
    fi
}

# Set backup directory
BACKUP_DIR="$HOME/termux_backups"

print_color "$YELLOW" "TermuXpert Termux Restore Script"

# Check if backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    print_color "$RED" "Error: Backup directory not found."
    exit 1
fi

# List available backups
print_color "$GREEN" "Available backups:"
ls -1 "$BACKUP_DIR"

# Prompt user to select a backup
read -p "Enter the name of the backup file to restore: " BACKUP_FILE

# Check if the selected backup file exists
if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    print_color "$RED" "Error: Selected backup file does not exist."
    exit 1
fi

# Confirm restoration
read -p "Are you sure you want to restore from $BACKUP_FILE? This will overwrite your current Termux setup. (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_color "$YELLOW" "Restore cancelled."
    exit 0
fi

# Perform restoration
print_color "$GREEN" "Restoring Termux from backup..."
run_command "tar -xzf $BACKUP_DIR/$BACKUP_FILE -C $HOME" "restore from backup"

print_color "$GREEN" "Termux restore completed successfully!"
print_color "$YELLOW" "Please restart Termux to apply all changes."