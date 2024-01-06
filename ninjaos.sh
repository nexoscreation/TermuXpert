#!/bin/bash
# Colors
CYAN='\033[0;36m'
PINK='\033[1;35m'                                                                        GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color                                                                                                                                                           # NinjaOS Installation Script

clear

# Function to display the NinjaOS logo with music  
display_logo() {
    echo "NinjaOS Installation"
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
echo " - Make sure your system meets the minimum requirements."

echo -e "${CYAN}2. Setting up Ninja Environment:${NC}"
echo " - Execute the following command in your terminal."
echo " - Follow the on-screen instructions to proceed."

echo -e "${CYAN}3. Customize Your NinjaOS:${NC}"
echo " - Explore the various configuration options in the settings."
echo " - Personalize your shell, themes, and additional tools."

echo -e "${CYAN}4. Enjoy Featurastic NinjaOS:${NC}"
echo " - Congratulations! Your Featurastic NinjaOS is ready to use."
echo -e " - Visit \033[4mhttps://featurastic-ninjaos.com\033[0m for updates and support."
}

# Function to execute the selected option
execute_option() {
    read -p "Enter the option number: " choice
    case $choice in
        1) bash ./bin/install.sh;;
        2) bash ./bin/zsh_shell.sh ;;
        3) bash ./bin/bash_shell.sh ;;
        4) bash ./bin/bash_shell.sh ;;
        5) bash ./bin/zsh_banner.sh ;;
        6) bash ./bin/update.sh ;;
        7) bash ./bin/highlight_autosuggest.sh ;;
        8) bash ./scripts/update_featurastic.sh ;;
        9) bash ./bin/exit.sh ;;
        *) echo "Invalid option. Please enter a valid option." ;;
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