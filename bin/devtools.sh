#!/bin/bash
# TermuXpert - Development Tools Setup Script

clear
echo "======================================"
echo "      TermuXpert Development Tools    "
echo "======================================"

# Update package list and install tools
echo "Choose the development tools to install:"
echo "1. Git"
echo "2. Node.js"
echo "3. Python"
read -p "Select an option: " dev_option

case $dev_option in
  1) pkg install -y git && echo "Git installed." ;;
  2) pkg install -y nodejs && echo "Node.js installed." ;;
  3) pkg install -y python && echo "Python installed." ;;
  *) echo "Invalid option." ;;
esac

# Optional: Set up Python virtual environments
pkg install -y python-venv
echo "Development tools installed: Git, Python, Node.js"

# Display git configuration help
echo "Don't forget to set up Git with:"
echo "git config --global user.name 'Your Name'"
echo "git config --global user.email 'you@example.com'"