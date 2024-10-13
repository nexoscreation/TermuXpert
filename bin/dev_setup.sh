#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

while true; do
    echo -e "${YELLOW}Development Environment Setup:${RESET}"
    echo -e "${CYAN}1.${RESET} Install Python development tools"
    echo -e "${CYAN}2.${RESET} Install Node.js and npm"
    echo -e "${CYAN}3.${RESET} Install Git and configure"
    echo -e "${CYAN}4.${RESET} Install C/C++ development tools"
    echo -e "${CYAN}5.${RESET} Install Ruby and Rails"
    echo -e "${CYAN}6.${RESET} Install Java development tools"
    echo -e "${CYAN}1.${RESET} Return to main menu"
    read -p "Select an option: " dev_choice

    case $dev_choice in
        1)
            pkg install python -y
            pip install ipython pylint black
            echo -e "${GREEN}Python development tools installed.${RESET}"
            ;;
        2)
            pkg install nodejs -y
            npm install -g yarn typescript eslint
            echo -e "${GREEN}Node.js, npm, and global packages installed.${RESET}"
            ;;
        3)
            pkg install git -y
            read -p "Enter your Git username: " git_username
            read -p "Enter your Git email: " git_email
            git config --global user.name "$git_username"
            git config --global user.email "$git_email"
            git config --global core.editor nano
            echo -e "${GREEN}Git installed and configured.${RESET}"
            ;;
        4)
            pkg install clang -y
            pkg install make -y
            pkg install cmake -y
            echo -e "${GREEN}C/C++ development tools installed.${RESET}"
            ;;
        5)
            pkg install ruby -y
            gem install rails
            echo -e "${GREEN}Ruby and Rails installed.${RESET}"
            ;;
        6)
            pkg install openjdk-17 -y
            echo -e "${GREEN}Java development tools installed.${RESET}"
            ;;
        7) exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "$(echo -e ${RED}Press any key to continue...${RESET} )"
    echo ""
done