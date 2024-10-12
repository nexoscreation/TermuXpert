#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

BACKUP_DIR="$HOME/termux_backups"
mkdir -p "$BACKUP_DIR"

while true; do
    echo -e "${YELLOW}Backup and Restore:${RESET}"
    echo "1. Create a new backup"
    echo "2. List available backups"
    echo "3. Restore from backup"
    echo "4. Delete a backup"
    echo "5. Return to main menu"
    read -p "Select an option: " backup_choice

    case $backup_choice in
        1)
            BACKUP_FILE="termux_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
            echo "Creating backup..."
            tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$HOME" \
                --exclude="./storage" \
                --exclude="./downloads" \
                --exclude="./termux_backups" \
                .
            echo -e "${GREEN}Backup created: $BACKUP_DIR/$BACKUP_FILE${RESET}"
            ;;
        2)
            echo "Available backups:"
            ls -1 "$BACKUP_DIR"
            ;;
        3)
            echo "Available backups:"
            ls -1 "$BACKUP_DIR"
            read -p "Enter the backup file name to restore: " restore_file
            if [ -f "$BACKUP_DIR/$restore_file" ]; then
                echo "Restoring from backup..."
                tar -xzf "$BACKUP_DIR/$restore_file" -C "$HOME"
                echo -e "${GREEN}Restore completed.${RESET}"
            else
                echo -e "${RED}Backup file not found.${RESET}"
            fi
            ;;
        4)
            echo "Available backups:"
            ls -1 "$BACKUP_DIR"
            read -p "Enter the backup file name to delete: " delete_file
            if [ -f "$BACKUP_DIR/$delete_file" ]; then
                rm "$BACKUP_DIR/$delete_file"
                echo -e "${GREEN}Backup deleted.${RESET}"
            else
                echo -e "${RED}Backup file not found.${RESET}"
            fi
            ;;
        5) exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "Press any key to continue..."
    echo ""
done