#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

while true; do
    echo -e "${YELLOW}Package Management:${RESET}"
    echo "1. Update package lists"
    echo "2. Upgrade installed packages"
    echo "3. Install a new package"
    echo "4. Remove a package"
    echo "5. List installed packages"
    echo "6. Search for a package"
    echo "7. Clean package cache"
    echo "8. Return to main menu"
    read -p "Select an option: " pkg_choice

    case $pkg_choice in
        1) pkg update ;;
        2) pkg upgrade ;;
        3) read -p "Enter package name to install: " pkg_name && pkg install $pkg_name ;;
        4) read -p "Enter package name to remove: " pkg_name && pkg uninstall $pkg_name ;;
        5) pkg list-installed ;;
        6) read -p "Enter package name to search: " pkg_name && pkg search $pkg_name ;;
        7) pkg clean ;;
        8) exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "Press any key to continue..."
    echo ""
done