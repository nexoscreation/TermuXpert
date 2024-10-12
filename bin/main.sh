#!/bin/bash
# TermuXpert - Main Entry Script

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
    echo -e "${BLUE}║${CYAN}  Expert-level Automation for Termux  ${BLUE}║${RESET}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${RESET}"
    echo ""
}

# Function to display the menu
display_menu() {
    echo -e "${YELLOW}Main Menu:${RESET}"
    echo -e "${CYAN}1.${RESET} Automate Backups"
    echo -e "${CYAN}2.${RESET} Set Up Personal Server"
    echo -e "${CYAN}3.${RESET} System Monitoring Tools"
    echo -e "${CYAN}4.${RESET} Customize Your Terminal"
    echo -e "${CYAN}5.${RESET} Development Tools"
    echo -e "${CYAN}6.${RESET} Task Scheduling"
    echo -e "${CYAN}7.${RESET} Exit"
    echo ""
}

# Function to get user choice
get_choice() {
    read -p "$(echo -e ${GREEN}Select an option [1-7]:${RESET} )" choice
    echo ""
}

# Function to execute the chosen option
execute_choice() {
    case $choice in
        1) ~/ninjaos-termux/bin/backup.sh ;;
        2) ~/ninjaos-termux/bin/server.sh ;;
        3) ~/ninjaos-termux/bin/monitor.sh ;;
        4) ~/ninjaos-termux/bin/customization.sh ;;
        5) ~/ninjaos-termux/bin/devtools.sh ;;
        6) ~/ninjaos-termux/bin/schedule.sh ;;
        7) echo -e "${MAGENTA}Exiting TermuXpert. Goodbye!${RESET}" && exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
}

# Main loop
while true; do
    display_header
    display_menu
    get_choice
    execute_choice
    echo ""
    read -n 1 -s -r -p "Press any key to continue..."
done