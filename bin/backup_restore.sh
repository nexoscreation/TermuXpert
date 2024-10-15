#!/data/data/com.termux/files/usr/bin/bash

# Import the configuration file
source "$HOME/termuxpert/config.sh"


# Function to create a backup
create_backup() {
    mkdir -p "$TERMUXPERT_BACKUP_DIR"
    BACKUP_FILE="termux_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Creating backup..."
    if tar -czf "$TERMUXPERT_BACKUP_DIR/$BACKUP_FILE" -C "$HOME" \
        --exclude="./storage" \
        --exclude="./downloads" \
        --exclude="./termux_backups" \
        .; then
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Backup created successfully: $TERMUXPERT_BACKUP_DIR/$BACKUP_FILE"
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to create backup."
    fi
}

# Function to list backups
list_backups() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Available backups:"
    ls -1 "$TERMUXPERT_BACKUP_DIR"
}

# Function to restore from backup
restore_backup() {
    list_backups
    echo
    read -p "Enter the backup file name to restore: " restore_file
    if [ -f "$TERMUXPERT_BACKUP_DIR/$restore_file" ]; then
        termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Restoring from backup..."
        if tar -xzf "$TERMUXPERT_BACKUP_DIR/$restore_file" -C "$HOME"; then
            termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Restore completed successfully."
        else
            termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to restore from backup."
        fi
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Backup file not found."
    fi
}

# Function to delete a backup
delete_backup() {
    list_backups
    echo
    read -p "Enter the backup file name to delete: " delete_file
    if [ -f "$TERMUXPERT_BACKUP_DIR/$delete_file" ]; then
        if rm "$TERMUXPERT_BACKUP_DIR/$delete_file"; then
            termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Backup deleted successfully."
        else
            termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to delete backup."
        fi
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Backup file not found."
    fi
}

# Main menu
show_menu() {
    clear
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Backup and Restore"
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
            *) termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Invalid option. Please try again." ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main