#!/bin/bash

# Function to install a music player
install_music_player() {
    echo "Installing music player..."
    pkg install -y mpg123 & # Example: Install MPV media player
    # Add more commands as needed for your preferred music player setup
}

# Function to install Git
install_git() {
    echo "Installing Git..."
    pkg install -y git & 
    # Configure Git if needed
    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"
    # Add more Git configurations or commands as needed
}

clear
# Main script logic
echo "> NinjaOS Initialization"

# Update package lists
echo "> Updating Termux package"
pkg update & 

# Install essential packages
echo "> Installing Nexos package"
pkg install -y git zsh nodejs & # Add essential packages for your setup

# Install music player
install_music_player

# Install Git
echo "> Skipping Git inztall"
# install_git

# Additional customizations and installations
# Add more tasks as per your requirements

echo "> Initialization complete."