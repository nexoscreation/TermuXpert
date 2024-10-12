#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert - Advanced Termux Management Script

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# Function to display the header
display_header() {
    clear
    echo -e "${BLUE}╔════════════════════════════════════════╗${RESET}"
    echo -e "${BLUE}║${WHITE}        Welcome to TermuXpert         ${BLUE}║${RESET}"
    echo -e "${BLUE}║${CYAN}  Advanced Termux Management Tool    ${BLUE}║${RESET}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${RESET}"
    echo ""
}

# Function to display the menu
display_menu() {
    echo -e "${YELLOW}Main Menu:${RESET}"
    echo -e "${CYAN}1.${RESET} System Information"
    echo -e "${CYAN}2.${RESET} Package Management"
    echo -e "${CYAN}3.${RESET} Backup and Restore"
    echo -e "${CYAN}4.${RESET} System Monitoring"
    echo -e "${CYAN}5.${RESET} Network Tools"
    echo -e "${CYAN}6.${RESET} Termux Customization"
    echo -e "${CYAN}7.${RESET} Development Environment Setup"
    echo -e "${CYAN}8.${RESET} Exit"
    echo ""
}

# Function to get user choice
get_choice() {
    read -p "$(echo -e ${GREEN}Select an option [1-8]:${RESET} )" choice
    echo ""
}

# Main loop
while true; do
    display_header
    display_menu
    get_choice
    case $choice in
        1) ./bin/system_info.sh ;;
        2) ./bin/package_manager.sh ;;
        3) ./bin/backup_restore.sh ;;
        4) ./bin/system_monitor.sh ;;
        5) ./bin/network_tools.sh ;;
        6) ./bin/customization.sh ;;
        7) ./bin/dev_setup.sh ;;
        8) echo -e "${MAGENTA}Exiting TermuXpert. Goodbye!${RESET}" && exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "Press any key to continue..."
done