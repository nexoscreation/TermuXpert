#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Function to run a command and check for errors
run_command() {
    if ! $1; then
        print_color "$RED" "Error: Failed to $2"
        exit 1
    fi
}

print_color "$YELLOW" "TermuXpert System Update Script"

# Update package lists
print_color "$GREEN" "Updating package lists..."
run_command "pkg update -y" "update package lists"

# Upgrade installed packages
print_color "$GREEN" "Upgrading installed packages..."
run_command "pkg upgrade -y" "upgrade installed packages"

# Clean package cache
print_color "$GREEN" "Cleaning package cache..."
run_command "pkg clean" "clean package cache"

# Update pip packages
if command -v pip &> /dev/null; then
    print_color "$GREEN" "Updating pip packages..."
    pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
fi

# Update npm packages
if command -v npm &> /dev/null; then
    print_color "$GREEN" "Updating npm packages..."
    npm update -g
fi

# Update Termux-tools
if [ -d "$HOME/termux-tools" ]; then
    print_color "$GREEN" "Updating Termux-tools..."
    run_command "cd $HOME/termux-tools && git pull" "update Termux-tools"
fi

# Update TermuXpert
if [ -d "$HOME/termuxpert" ]; then
    print_color "$GREEN" "Updating TermuXpert..."
    run_command "cd $HOME/termuxpert && git pull" "update TermuXpert"
fi

print_color "$GREEN" "System update completed successfully!"