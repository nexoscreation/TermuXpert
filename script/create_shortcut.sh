#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}TermuXpert Shortcut Creation Script${RESET}"

# Check if Termux:Widget is installed
if ! command -v termux-widget &> /dev/null; then
    echo -e "${RED}Error: Termux:Widget is not installed.${RESET}"
    echo "Please install Termux:Widget from the Google Play Store or F-Droid."
    exit 1
fi

# Create shortcuts directory if it doesn't exist
SHORTCUTS_DIR="$HOME/.shortcuts"
mkdir -p "$SHORTCUTS_DIR"

# Function to create a shortcut
create_shortcut() {
    local name="$1"
    local command="$2"
    local file_path="$SHORTCUTS_DIR/$name"

    echo "#!/data/data/com.termux/files/usr/bin/bash" > "$file_path"
    echo "$command" >> "$file_path"
    chmod +x "$file_path"

    echo -e "${GREEN}Shortcut '$name' created successfully!${RESET}"
}

# Main menu
while true; do
    echo -e "\n${YELLOW}Create Shortcut Menu:${RESET}"
    echo "1. Create TermuXpert shortcut"
    echo "2. Create custom command shortcut"
    echo "3. List existing shortcuts"
    echo "4. Delete a shortcut"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            create_shortcut "TermuXpert" "$HOME/termuxpert/bin/termuxpert.sh"
            ;;
        2)
            read -p "Enter shortcut name: " name
            read -p "Enter command to execute: " command
            create_shortcut "$name" "$command"
            ;;
        3)
            echo -e "\n${GREEN}Existing shortcuts:${RESET}"
            ls -1 "$SHORTCUTS_DIR"
            ;;
        4)
            read -p "Enter shortcut name to delete: " name
            if [ -f "$SHORTCUTS_DIR/$name" ]; then
                rm "$SHORTCUTS_DIR/$name"
                echo -e "${GREEN}Shortcut '$name' deleted successfully!${RESET}"
            else
                echo -e "${RED}Shortcut '$name' not found.${RESET}"
            fi
            ;;
        5)
            echo -e "${GREEN}Exiting shortcut creation script.${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice. Please try again.${RESET}"
            ;;
    esac
done