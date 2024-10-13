#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

while true; do
    echo -e "${YELLOW}Package Management:${RESET}"
    echo -e "${CYAN}1.${RESET} Update package lists"
    echo -e "${CYAN}2.${RESET} Upgrade installed packages"
    echo -e "${CYAN}3.${RESET} Install a new package"
    echo -e "${CYAN}4.${RESET} Remove a package"
    echo -e "${CYAN}5.${RESET} List installed packages"
    echo -e "${CYAN}6.${RESET} Search for a package"
    echo -e "${CYAN}7.${RESET} Clean package cache"
    echo -e "${CYAN}8.${RESET} Return to main menu"
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
    read -n 1 -s -r -p "$(echo -e ${RED}Press any key to continue...${RESET} )"
    echo ""
done