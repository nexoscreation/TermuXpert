#!/bin/bash

# Bash setup script for NinjaOS

# Colors for styling
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'  # No Color

# Function to display messages in green color
success_msg() {
  echo -e "${GREEN}$1${NC}"
}

# Function to display messages in yellow color
warning_msg() {
  echo -e "${YELLOW}$1${NC}"
}

# Backup existing bashrc file
if [ -f ~/.bashrc ]; then
  mv ~/.bashrc ~/.bashrc_backup
  success_msg "Backup created: ~/.bashrc_backup"
fi

# Create a new bashrc file
cat <<EOL >~/.bashrc
# NinjaOS Bash Configuration

# Add your custom aliases here
alias ll='ls -alF'
alias ninja='echo "NinjaOS is awesome!"'

# Set a custom PS1 prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Add any other custom configurations below

EOL

success_msg "Bash setup completed. Restart your terminal to apply changes."


clear
echo " - Congratulations! Your NinjaOS is updated."
cd ~/ninjaos-termux ; bash ninjaos.sh