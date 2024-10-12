#!/bin/bash

# TermuXpert Installation Script

clear
echo "======================================"
echo "    Installing TermuXpert Package     "
echo "======================================"

packages=(
    "git"
    "nodejs"
    "vim"
)

for package in "${packages[@]}"
do
    echo "Installing $package..."
    pkg install -y "$package"
done

echo "All packages installed successfully!"

# Create necessary directories
mkdir -p ~/ninjaos-termux/bin
mkdir -p ~/ninjaos-termux/config
mkdir -p ~/ninjaos-termux/data/backups

# Copy the scripts to the Termux home directory
cp -r bin/* ~/ninjaos-termux/bin/
cp -r config/* ~/ninjaos-termux/config/

# Make the scripts executable
chmod +x ~/ninjaos-termux/bin/*.sh

echo "TermuXpert successfully installed!"
echo "Run '~/ninjaos-termux/bin/main.sh' to start using TermuXpert."
