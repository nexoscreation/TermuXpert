#!/bin/bash
clear

# Source the common file is available
source ./bin/style.sh
source ./config/colors.sh
source ./config/aliases.sh
source ./config/settings.sh

# NinjaOS Installation Script
bash ./bin/play_music.sh &
# Resettion to display the NinjaOS logo with music  
display_logo() {
    cat << "EOF"
    ╔═╗─╔╦══╦═╗─╔╗─╔╦═══╦═══╦═══╗
    ║║╚╗║╠╣╠╣║╚╗║║─║║╔═╗║╔═╗║╔═╗║
    ║╔╗╚╝║║║║╔╗╚╝║─║║║─║║║─║║╚══╗
    ║║╚╗║║║║║║╚╗║╠╗║║╚═╝║║─║╠══╗║
    ║║─║║╠╣╠╣║─║║║╚╝║╔═╗║╚═╝║╚═╝║
    ╚╝─╚═╩══╩╝─╚═╩══╩╝─╚╩═══╩═══╝
EOF
bash ./bin/loader.sh &
sleep 20
kill $!
clear
}

# Resettion to display the NinjaOS banner
display_banner() {
bash ./bin/header.sh
echo ""
echo -e "${YELLOW}${Cyan}╔════════════════════ NINJA OS ════════════════════╗${Reset}"
echo -e "${YELLOW}${Cyan}║                                                  ║${Reset}"
echo -e "${YELLOW}${Cyan}║                    Welcome!                      ║${Reset}"
echo -e "${YELLOW}${Cyan}║      Explore the Features with Ninja os!         ║${Reset}"
echo -e "${YELLOW}${Cyan}║                                                  ║${Reset}"
echo -e "${YELLOW}${Cyan}╚══════════════════════════════════════════════════╝${Reset}"
echo ""
}

# Resettion to display NinjaOS installation steps
installation_steps() {
echo -e "${Pink}-----------------------------------------------------------${Reset}"
echo ""
echo -e "${Red}NinjaOS Installation Steps:\n${Reset}"
echo -e "${Cyan}1. Prepare the Ninja Environment${Reset}"
echo -e "${Cyan}2. Setting up Ninja Environment${Reset}"
echo -e "${Cyan}3. Customize${Reset}"
echo -e "${Cyan}4. Troobleshoot${Reset}"
echo -e "${Cyan}5. Explore Tools${Reset}"
echo -e "${Cyan}6. Expirmental Feature${Reset}"
echo -e "${Cyan}7. Update${Reset}"
echo -e "${Cyan}8. Uninstall${Reset}"
echo -e "${Cyan}9. Exit${Reset}"
echo ""
echo -e "${Pink}-----------------------------------------------------------${Reset}"
}

# Resettion to execute the selected option
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

# Main fuResettion to orchestrate the installation process
main() {
    display_logo
    display_banner
    installation_steps
    execute_option
}

# Run the main fuResettion
main
