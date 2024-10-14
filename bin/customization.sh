#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

while true; do
    echo -e "${YELLOW}Termux Customization:${RESET}"
    echo -e "${CYAN}1.${RESET} Install Zsh and Oh My Zsh"
    echo -e "${CYAN}2.${RESET} Set custom color scheme"
    echo -e "${CYAN}3.${RESET} Configure extra keys"
    echo -e "${CYAN}4.${RESET} Install and configure Powerlevel10k theme"
    echo -e "${CYAN}5.${RESET} Install and configure syntax highlighting"
    echo -e "${CYAN}6.${RESET} Install and configure Vim"
    echo -e "${CYAN}7.${RESET} Install and configure Tmux"
    echo -e "${CYAN}8.${RESET} Return to main menu"
    read -p "Select an option: " custom_choice

    case $custom_choice in
        1)
            pkg install zsh -y
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            ;;
        2)
            echo "Setting a custom color scheme..."
            cp ~/termuxpert/config/colors.properties ~/.termux/colors.properties
            echo -e "${GREEN}Custom color scheme set. Restart Termux to apply changes.${RESET}"
            ;;
        3)
            echo "Configuring extra keys..."
            cp ~/termuxpert/config/termux.properties ~/.termux/termux.properties
            echo -e "${GREEN}Extra keys configured. Restart Termux to apply changes.${RESET}"
            ;;
        4)
            if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
            echo "Installing Powerlevel10k theme..."
            git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
            sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
            else
            echo "Powerlevel10k theme is already installed."
            fi
            ;;
        5)
            if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
            echo "Installing zsh-syntax-highlighting..."
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
            sed -i 's/plugins=(.*)/plugins=(git zsh-syntax-highlighting)/' ~/.zshrc
            else
            echo "zsh-syntax-highlighting is already installed."
            fi
            ;;
        6)
            pkg install vim -y
            echo "set number\nset autoindent\nset expandtab\nset tabstop=4\nset shiftwidth=4" > ~/.vimrc
            echo -e "${GREEN}Vim installed and configured.${RESET}"
            ;;
        7)
            pkg install tmux -y
            echo "set -g mouse on\nset  -g history-limit 10000\nset -g default-terminal \"screen-256color\"" > ~/.tmux.conf
            echo -e "${GREEN}Tmux installed and configured.${RESET}"
            ;;
        8) exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "$(echo -e ${RED}Press any key to continue...${RESET} )"
    echo ""
done