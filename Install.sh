#!/bin/bash

# TermuXpert Installation Script

clear
echo "======================================"
echo "    Installing TermuXpert Package     "
echo "======================================"

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
