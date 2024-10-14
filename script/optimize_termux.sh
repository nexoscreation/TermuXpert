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

print_color "$YELLOW" "TermuXpert Termux Optimization Script"

# Clear package cache
print_color "$GREEN" "Clearing package cache..."
run_command "pkg clean" "clear package cache"

# Remove unused packages
print_color "$GREEN" "Removing unused packages..."
run_command "apt autoremove -y" "remove unused packages"

# Optimize apt database
print_color "$GREEN" "Optimizing apt database..."
run_command "apt-get autoclean" "autoclean apt database"
run_command "apt-get clean" "clean apt database"

# Clear app cache
print_color "$GREEN" "Clearing app cache..."
run_command "rm -rf $HOME/.cache/*" "clear app cache"

# Optimize Termux home
print_color "$GREEN" "Optimizing Termux home..."
run_command "rm -rf $HOME/.termux/boot" "remove Termux boot directory"

# Optimize bash history
print_color "$GREEN" "Optimizing bash history..."
sed -i 's/^HISTSIZE=.*/HISTSIZE=1000/' $HOME/.bashrc
sed -i 's/^HISTFILESIZE=.*/HISTFILESIZE=2000/' $HOME/.bashrc

# Set up periodic optimization
print_color "$GREEN" "Setting up periodic optimization..."
(crontab -l 2>/dev/null; echo "0 2 * * 0 $HOME/termuxpert/scripts/optimize_termux.sh") | crontab -

print_color "$GREEN" "Termux optimization completed successfully!"
print_color "$YELLOW" "Note: A weekly cron job has been set up to run this optimization script."