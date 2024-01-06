#!/bin/bash

echo -e "\nUpdating NinjaOS...\n"

# Update the Termux package repositories
pkg update

# Upgrade installed packages
pkg upgrade -y

# Additional update steps for specific tools or configurations, if needed
# For example, if you've cloned a repository for a specific tool, you can update it here.

echo -e "\nNinjaOS update complete!\n"
