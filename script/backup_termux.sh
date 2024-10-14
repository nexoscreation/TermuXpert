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
BACKUP_FILE="termux_backup_$(date +%Y%m%d_%H%M%S).tar.gz"

print_color "$YELLOW" "TermuXpert Termux Backup Script"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
print_color "$GREEN" "Creating Termux backup..."
run_command "tar -czf $BACKUP_DIR/$BACKUP_FILE -C $HOME \
    --exclude='./storage' \
    --exclude='./termux_backups' \
    --exclude='./.cache' \
    --exclude='./.npm' \
    --exclude='./.gradle' \
    --exclude='./.android' \
    ." "create backup"

print_color "$GREEN" "Backup created successfully: $BACKUP_DIR/$BACKUP_FILE"

# Optional: Upload to cloud storage (example using rclone)
if command -v rclone &> /dev/null; then
    read -p "Do you want to upload the backup to cloud storage? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_color "$GREEN" "Uploading backup to cloud storage..."
        run_command "rclone copy $BACKUP_DIR/$BACKUP_FILE remote:termux_backups/" "upload backup to cloud storage"
        print_color "$GREEN" "Backup uploaded successfully!"
    fi
fi

print_color "$GREEN" "Termux backup process completed!"