#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Installation Script

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function to print centered text
print_centered() {
    local text="$1"
    local color="$2"
    local width=$(tput cols)
    local padding=$(( (width - ${#text}) / 2 ))
    printf "${color}%*s%s%*s${RESET}\n" $padding '' "$text" $padding ''
}

# Clear screen and print header
clear
echo
print_centered "======================================" "${CYAN}"
print_centered "    TermuXpert Installation Script    " "${YELLOW}"
print_centered "======================================" "${CYAN}"
echo

# Available packages
packages=(
    "git"
    "nodejs"
    "vim"
    "zsh"
)

# Function to install selected packages
install_packages() {
    local selected_packages=("$@")
    for package in "${selected_packages[@]}"
    do
        echo -e "${BLUE}Installing ${YELLOW}$package${BLUE}...${RESET}"
        pkg install -y "$package"
    done
}

# Package selection menu
echo -e "${GREEN}Select packages to install (use space to select/deselect):${RESET}"
selected_packages=()
PS3=$'\n'"${YELLOW}Enter your choice (1-7): ${RESET}"
select package in "${packages[@]}" "Done"; do
    case $package in
        "Done")
            break
            ;;
        *)
            if [[ " ${selected_packages[*]} " =~ " $package " ]]; then
                selected_packages=(${selected_packages[@]/$package})
                echo -e "${RED}Deselected: $package${RESET}"
            else
                selected_packages+=("$package")
                echo -e "${GREEN}Selected: $package${RESET}"
            fi
            ;;
    esac
done

# Install selected packages
if [ ${#selected_packages[@]} -eq 0 ]; then
    echo -e "${RED}No packages selected. Skipping installation.${RESET}"
else
    echo
    echo -e "${CYAN}Installing selected packages...${RESET}"
    install_packages "${selected_packages[@]}"
    echo -e "${GREEN}All selected packages installed successfully!${RESET}"
fi

# Create necessary directories
echo
echo -e "${MAGENTA}Creating necessary directories...${RESET}"
mkdir -p ~/ninjaos-termux/config
mkdir -p ~/ninjaos-termux/data/backups

# Make the scripts executable
echo -e "${MAGENTA}Making scripts executable...${RESET}"
chmod +x ~/ninjaos-termux/bin/*.sh

# Final message
echo
print_centered "======================================" "${CYAN}"
print_centered "  TermuXpert successfully installed!  " "${GREEN}"
print_centered "======================================" "${CYAN}"
echo
echo -e "${YELLOW}Run '~/ninjaos-termux/bin/main.sh' to start using TermuXpert.${RESET}"
echo