#!/bin/bash

# Function to install a music player
install_music_player() {
    echo "Installing music player..."
    pkg install -y mpv & # Example: Install MPV media player
    # Add more commands as needed for your preferred music player setup
}

# Function to install Git
install_git() {
    echo "Installing Git..."
    pkg install -y git
    # Configure Git if needed
    git config --global user.name "Your Name"
    git config --global user.email "you@example.com"
    # Add more Git configurations or commands as needed
}


# Main script logic
echo "NinjaOS Initialization"

# Update package lists
pkg update

# Install essential packages
pkg install -y git node zsh  # Add essential packages for your setup

# Install music player
install_music_player

# Install Git
# install_git

# Additional customizations and installations
# Add more tasks as per your requirements

echo "Initialization complete."