#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert - Advanced Termux Management Script

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Color definitions
NEON_PINK='\033[38;2;255;20;147m'

# Script directory
SCRIPT_DIR="$HOME/termuxpert/bin"

# Function to display the header
display_header() {
    clear
    echo ""
    echo -e "${NEON_PINK}"
    echo -e "                                                             "
    echo -e "  _______                      __  __                  _     "
    echo -e " |__   __|                    |  \/  |                | |    "
    echo -e "    | | ___ _ __ _ __ ___  _  | \  / |_ __   ___ _ __ | |_   "
    echo -e "    | |/ _ \ '__| '_ \` _ \| | | |\/| | '_ \ / _ \ '__|| __| "
    echo -e "    | |  __/ |  | | | | | | | | |  | | |_) |  __/ |   | |_   "
    echo -e "    |_|\___|_|  |_| |_| |_|_| |_|  |_| .__/ \___|_|    \__|  "
    echo -e "                                     | |                     "
    echo -e "                                     |_|                     "
    echo -e "                                                             "
    echo -e "${TERMUXPERT_COLOR_RESET}"
    echo ""
}

# Function to display the menu
display_menu() {
    echo ""
    echo -e "${TERMUXPERT_COLOR_MAGENTA}╔═══════════════════════════════════════════════╗${TERMUXPERT_COLOR_RESET}"
    echo -e "${TERMUXPERT_COLOR_MAGENTA}║                ${TERMUXPERT_COLOR_CYAN}Main Menu${TERMUXPERT_COLOR_MAGENTA}                      ║${TERMUXPERT_COLOR_RESET}"
    echo -e "${TERMUXPERT_COLOR_MAGENTA}╚═══════════════════════════════════════════════╝${TERMUXPERT_COLOR_RESET}"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 1.${TERMUXPERT_COLOR_RESET} System Information"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 2.${TERMUXPERT_COLOR_RESET} Package Management"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 3.${TERMUXPERT_COLOR_RESET} Backup and Restore"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 4.${TERMUXPERT_COLOR_RESET} System Monitoring"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 5.${TERMUXPERT_COLOR_RESET} Network Tools"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 6.${TERMUXPERT_COLOR_RESET} Termux Customization"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 7.${TERMUXPERT_COLOR_RESET} Dev Environment Setup"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 8.${TERMUXPERT_COLOR_RESET} Security Tools"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 9.${TERMUXPERT_COLOR_RESET} Help"
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 0.${TERMUXPERT_COLOR_RESET} Exit"
    echo ""
}

# Function to get user choice
get_choice() {
    read -p "$(echo -e ${TERMUXPERT_COLOR_GREEN}Select an option [0-9]:${TERMUXPERT_COLOR_RESET} )" choice
    echo ""
}

# Function to execute a script
execute_script() {
    local script="$SCRIPT_DIR/$1"
    if [ -f "$script" ] && [ -x "$script" ]; then
        "$script"
    else
        echo -e "${TERMUXPERT_COLOR_RED}Error: Script $1 not found or not executable.${TERMUXPERT_COLOR_RESET}"
    fi
}

# Function to display help
display_help() {
    echo -e "${TERMUXPERT_COLOR_YELLOW}TermuXpert Help:${TERMUXPERT_COLOR_RESET}"
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
    echo -e "${TERMUXPERT_COLOR_YELLOW}For more detailed information, please refer to the documentation.${TERMUXPERT_COLOR_RESET}"
}

# Trap Ctrl+C
trap ctrl_c INT

function ctrl_c() {
    echo -e "\n${TERMUXPERT_COLOR_YELLOW}Ctrl+C detected. Exiting...${TERMUXPERT_COLOR_RESET}"
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
        0) echo -e "${TERMUXPERT_COLOR_MAGENTA}Exiting TermuXpert. Goodbye!${TERMUXPERT_COLOR_RESET}" && exit 0 ;;
        *) echo -e "${TERMUXPERT_COLOR_RED}Invalid choice. Please try again.${TERMUXPERT_COLOR_RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "$(echo -e ${TERMUXPERT_COLOR_YELLOW}Press any key to continue...${TERMUXPERT_COLOR_RESET})"
done