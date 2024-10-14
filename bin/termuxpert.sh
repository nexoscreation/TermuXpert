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
NEON_PINK='\033[38;2;255;20;147m'
RESET='\033[0m'

# Script directory
SCRIPT_DIR="$HOME/termuxpert/bin"

# Function to display the header
display_header() {
    clear
    echo -e "${NEON_PINK}"
    echo "  _______                      __  __                  _   "
    echo " |__   __|                    |  \/  |                | |  "
    echo "    | | ___ _ __ _ __ ___  _  | \  / |_ __   ___ _ __ | |_ "
    echo "    | |/ _ \ '__| '_ \` _ \| | | |\/| | '_ \ / _ \ '__|| __|"
    echo "    | |  __/ |  | | | | | | | | |  | | |_) |  __/ |   | |_ "
    echo "    |_|\___|_|  |_| |_| |_|_| |_|  |_| .__/ \___|_|    \__|"
    echo "                                     | |                   "
    echo "                                     |_|                   "
    echo -e "${RESET}"
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
    echo -e "${CYAN}8.${RESET} Security Tools"
    echo -e "${CYAN}9.${RESET} Help"
    echo -e "${CYAN}0.${RESET} Exit"
    echo ""
}

# Function to get user choice
get_choice() {
    read -p "$(echo -e ${GREEN}Select an option [0-9]:${RESET} )" choice
    echo ""
}

# Function to execute a script
execute_script() {
    local script="$SCRIPT_DIR/$1"
    if [ -f "$script" ] && [ -x "$script" ]; then
        "$script"
    else
        echo -e "${RED}Error: Script $1 not found or not executable.${RESET}"
    fi
}

# Function to display help
display_help() {
    echo -e "${YELLOW}TermuXpert Help:${RESET}"
    echo "This tool provides various utilities for managing your Termux environment."
    echo ""
    echo "Available options:"
    echo "1. System Information - Display details about your Termux system"
    echo "2. Package Management - Manage Termux packages"
    echo "3. Backup and Restore - Backup and restore your Termux environment"
    echo "4. System Monitoring - Monitor system resources"
    echo "5. Network Tools - Various network-related utilities"
    echo "6. Termux Customization - Customize your Termux environment"
    echo "7. Development Environment Setup - Set up development environments"
    echo "8. Security Tools - Various security-related utilities"
    echo "9. Help - Display this help message"
    echo "0. Exit - Exit TermuXpert"
    echo ""
    echo -e "${YELLOW}For more detailed information, please refer to the documentation.${RESET}"
}

# Trap Ctrl+C
trap ctrl_c INT

function ctrl_c() {
    echo -e "\n${YELLOW}Ctrl+C detected. Exiting...${RESET}"
    exit 1
}

# Check for updates
check_for_updates() {
    if [ -f "$SCRIPT_DIR/../update.sh" ]; then
        "$SCRIPT_DIR/../update.sh" --check-only
    fi
}

# Main loop
while true; do
    display_header
    check_for_updates
    display_menu
    get_choice
    case $choice in
        1) execute_script "system_info.sh" ;;
        2) execute_script "package_manager.sh" ;;
        3) execute_script "backup_restore.sh" ;;
        4) execute_script "system_monitor.sh" ;;
        5) execute_script "network_tools.sh" ;;
        6) execute_script "customization.sh" ;;
        7) execute_script "dev_setup.sh" ;;
        8) execute_script "security_tools.sh" ;;
        9) display_help ;;
        0) echo -e "${MAGENTA}Exiting TermuXpert. Goodbye!${RESET}" && exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "$(echo -e ${YELLOW}Press any key to continue...${RESET})"
done