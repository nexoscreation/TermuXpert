#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Backup directory
BACKUP_DIR="$HOME/termux_backups"

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Function to create a backup
create_backup() {
    mkdir -p "$BACKUP_DIR"
    BACKUP_FILE="termux_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
    print_color "$YELLOW" "Creating backup..."
    if tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$HOME" \
        --exclude="./storage" \
        --exclude="./downloads" \
        --exclude="./termux_backups" \
        .; then
        print_color "$GREEN" "Backup created successfully: $BACKUP_DIR/$BACKUP_FILE"
    else
        print_color "$RED" "Failed to create backup."
    fi
}

# Function to list backups
list_backups() {
    print_color "$CYAN" "Available backups:"
    ls -1 "$BACKUP_DIR"
}

# Function to restore from backup
restore_backup() {
    list_backups
    echo
    read -p "Enter the backup file name to restore: " restore_file
    if [ -f "$BACKUP_DIR/$restore_file" ]; then
        print_color "$YELLOW" "Restoring from backup..."
        if tar -xzf "$BACKUP_DIR/$restore_file" -C "$HOME"; then
            print_color "$GREEN" "Restore completed successfully."
        else
            print_color "$RED" "Failed to restore from backup."
        fi
    else
        print_color "$RED" "Backup file not found."
    fi
}

# Function to delete a backup
delete_backup() {
    list_backups
    echo
    read -p "Enter the backup file name to delete: " delete_file
    if [ -f "$BACKUP_DIR/$delete_file" ]; then
        if rm "$BACKUP_DIR/$delete_file"; then
            print_color "$GREEN" "Backup deleted successfully."
        else
            print_color "$RED" "Failed to delete backup."
        fi
    else
        print_color "$RED" "Backup file not found."
    fi
}

# Main menu
show_menu() {
    clear
    print_color "$CYAN" "Backup and Restore"
    echo "1. Create a new backup"
    echo "2. List available backups"
    echo "3. Restore from backup"
    echo "4. Delete a backup"
    echo "5. Return to main menu"
    echo
    read -p "Enter your choice [1-5]: " choice
}

# Main function
main() {
    while true; do
        show_menu
        case $choice in
            1) create_backup ;;
            2) list_backups ;;
            3) restore_backup ;;
            4) delete_backup ;;
            5) return ;;
            *) print_color "$RED" "Invalid option. Please try again." ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main