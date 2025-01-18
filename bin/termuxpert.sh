#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert - Advanced Termux Management Script

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Color definitions
NEON_PINK='\033[38;2;255;20;147m'

# Script directory
SCRIPT_DIR="$HOME/termuxpert/bin"

USER_NAME=$(whoami)
HOST_NAME=$(uname -n)

# Function to display the header
display_header() {
    clear
    echo -e "${TERMUXPERT_COLOR_CYAN}Hello, ${USER_NAME}@${HOST_NAME}! Welcome to TermuXpert.${TERMUXPERT_COLOR_RESET}"
    echo -e "${NEON_PINK}"
    echo -e "└────╼                                                       "
    echo -e "  _______                      __  __                  _     "
    echo -e " |__   __|                    |  \/  |                | |    "
    echo -e "    | | ___ _ __ _ __ ___  _  | \  / |_ __   ___ _ __ | |_   "
    echo -e "    | |/ _ \ '__| '_ \` _ \| | | |\/| | '_ \ / _ \ '__|| __| "
    echo -e "    | |  __/ |  | | | | | | | | |  | | |_) |  __/ |   | |_   "
    echo -e "    |_|\___|_|  |_| |_| |_|_| |_|  |_| .__/ \___|_|    \__|  "
    echo -e "                                     | |                     "
    echo -e "                                     |_|                     "
    echo -e "                                                     v1.0.0  "
    echo -e "${TERMUXPERT_COLOR_RESET}"
}

# Function to display the menu
display_menu() {
    echo ""
    echo -e "${TERMUXPERT_COLOR_CYAN}╔═══════════════════════════════════════════════════════════╗${TERMUXPERT_COLOR_RESET}"
    echo -e "${TERMUXPERT_COLOR_CYAN}║                          Main Menu                        ║${TERMUXPERT_COLOR_RESET}"
    echo -e "${TERMUXPERT_COLOR_CYAN}╚═══════════════════════════════════════════════════════════╝${TERMUXPERT_COLOR_RESET}"
    echo ""
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 1.${TERMUXPERT_COLOR_RESET} System Information      - View system details           "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 2.${TERMUXPERT_COLOR_RESET} Package Management      - Manage installed packages     "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 3.${TERMUXPERT_COLOR_RESET} Backup and Restore      - Backup or restore files       "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 4.${TERMUXPERT_COLOR_RESET} System Monitoring       - Monitor system resources      "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 5.${TERMUXPERT_COLOR_RESET} Network Tools           - Network diagnostics           "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 6.${TERMUXPERT_COLOR_RESET} Termux Customization    - Customize Termux settings     "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 7.${TERMUXPERT_COLOR_RESET} Dev Environment Setup   - Setup development tools       "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 8.${TERMUXPERT_COLOR_RESET} Security Tools          - Access security utilities     "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 9.${TERMUXPERT_COLOR_RESET} Help                    - Get help or documentation     "
    echo -e "${TERMUXPERT_COLOR_CYAN}❯ 0.${TERMUXPERT_COLOR_RESET} Exit                    - Quit the application          "
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
    echo ""
    echo -e "${TERMUXPERT_COLOR_CYAN}╔═══════════════════════════════════════════════════════════╗${TERMUXPERT_COLOR_RESET}"
    echo -e "${TERMUXPERT_COLOR_CYAN}║                      TermuXpert Help                      ║${TERMUXPERT_COLOR_RESET}"
    echo -e "${TERMUXPERT_COLOR_CYAN}╚═══════════════════════════════════════════════════════════╝${TERMUXPERT_COLOR_RESET}"
    echo ""
    echo -e "This tool provides a variety of utilities to manage and enhance your Termux environment effectively."
    echo ""
    echo ""
    echo -e "┌─╼ ${TERMUXPERT_COLOR_GREEN}Helpful Links:${TERMUXPERT_COLOR_RESET}"
    echo -e "❯ ${TERMUXPERT_COLOR_CYAN}Discord Server:${TERMUXPERT_COLOR_RESET} Join our community for support and discussions."
    echo -e "   ${TERMUXPERT_COLOR_UNDERLINE}https://discord.gg/A3euTAVqHv${TERMUXPERT_COLOR_RESET}"
    echo ""
    echo -e "❯ ${TERMUXPERT_COLOR_CYAN}GitHub Repository:${TERMUXPERT_COLOR_RESET} Report issues or contribute to the project."
    echo -e "   ${TERMUXPERT_COLOR_UNDERLINE}https://github.com/nexoscreation/TermuXpert${TERMUXPERT_COLOR_RESET}"
    echo ""
    echo -e "❯ ${TERMUXPERT_COLOR_CYAN}Documentation:${TERMUXPERT_COLOR_RESET} Learn more about features and usage."
    echo -e "   ${TERMUXPERT_COLOR_UNDERLINE}https://docs.nexoscreator.tech${TERMUXPERT_COLOR_RESET}"
    echo ""
    echo -e "┌─╼ ${TERMUXPERT_COLOR_GREEN}Supports:${TERMUXPERT_COLOR_RESET}"
    echo -e "${PAD_SPACES}❯ ${TERMUXPERT_COLOR_CYAN}Contact Support:${TERMUXPERT_COLOR_RESET} Reach out for assistance."
    echo -e "${PAD_SPACES}   ${TERMUXPERT_COLOR_UNDERLINE}support@nexoscreator.tech${TERMUXPERT_COLOR_RESET}"
    echo ""
    echo -e "${TERMUXPERT_COLOR_YELLOW}Thank you for using TermuXpert!${TERMUXPERT_COLOR_RESET}"
    echo ""
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