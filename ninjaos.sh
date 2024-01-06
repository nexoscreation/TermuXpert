#!/bin/bash
# Colors
CYAN='\033[0;36m'
PINK='\033[1;35m'                                                                        
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color                                                                                                                                                           # NinjaOS Installation Script
local current_dir='%{$fg_bold[cyan]%}%~%{$reset_color%}'
local git_branch='%{$fg_bold[magenta]%}$(__git_ps1)%{$reset_color%}'
clear

# Function to display the NinjaOS logo with music  
display_logo() {
    echo "└────╼ ❯${git_branch} / ${current_dir}"
    echo "═════════════════════════════"
    cat << "EOF"
    ╔═╗─╔╦══╦═╗─╔╗─╔╦═══╦═══╦═══╗
    ║║╚╗║╠╣╠╣║╚╗║║─║║╔═╗║╔═╗║╔═╗║
    ║╔╗╚╝║║║║╔╗╚╝║─║║║─║║║─║║╚══╗
    ║║╚╗║║║║║║╚╗║╠╗║║╚═╝║║─║╠══╗║
    ║║─║║╠╣╠╣║─║║║╚╝║╔═╗║╚═╝║╚═╝║
    ╚╝─╚═╩══╩╝─╚═╩══╩╝─╚╩═══╩═══╝
EOF

if command -v play > /dev/null; then
echo -e "\n${GREEN}Music playback started in the background.${NC}"
play ./data/1704523429064_track.mp3 &
else
echo -e "\n${GREEN}Music playback is not available. Skipping...${NC}"
fi
sleep 20
clear
}

# Function to display the NinjaOS banner
display_banner() {
echo -e "${CYAN}╔════════════════════ ${GREEN}NINJA OS ${CYAN}════════════════════╗${NC}"
echo -e "${CYAN}║                                                  ║${NC}"
echo -e "${CYAN}║                    Welcome!                      ║${NC}"
echo -e "${CYAN}║      Explore the Features with Ninja os!         ║${NC}"
echo -e "${CYAN}║                                                  ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════╝${NC}"
echo ""
}

# Function to display NinjaOS installation steps
installation_steps() {
echo -e "${PINK}-----------------------------------------------------------${NC}"
echo ""
echo -e "${RED}NinjaOS Installation Steps:\n${NC}"
echo -e "${CYAN}1. Prepare the Ninja Environment:${NC}"
echo " - Ensure a stable internet connection."
echo -e "${CYAN}2. Setting up Ninja Environment:${NC}"
echo -e "${CYAN}3. Customize Your NinjaOS:${NC}"
echo " - Explore the various configuration options in the settings."
echo " - Personalize your shell, themes, and additional tools."
echo -e "${CYAN}4. Troobleshoot:${NC}"
echo -e "${CYAN}5. Explore Tools:${NC}"
echo -e "${CYAN}6. Expirmental Feature:${NC}"
echo -e "${CYAN}7. Update NinjaOS:${NC}"
echo -e "${CYAN}8. Uninstall NinjaOS:${NC}"
echo -e " - Visit \033[4mhttps://featurastic-ninjaos.com\033[0m for updates and support."
echo -e "${CYAN}9. Exit${NC}"
}

# Function to execute the selected option
execute_option() {
    read -p "Enter the option number (1 - 9): " choice
    case $choice in
        1) bash ./bin/install.sh;;
        2) bash ./bin/confi.sh ;;
        3) bash ./bin/customize.sh ;;
        4) bash ./bin/encrypt.sh ;;
        5) bash ./bin/netstatus.sh ;;
        6) bash ./bin/sysinfo.sh ;;
        7) bash ./bin/updatesh.sh ;;
        8) bash ./scripts/update_featurastic.sh ;;
        9) bash ./bin/exit.sh ;;
        *) bash ./bin/error.sh ;;
    esac
}

# Main function to orchestrate the installation process
main() {
    display_logo
    display_banner
    installation_steps
    execute_option
}

# Run the main function
main