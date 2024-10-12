#!/bin/bash
# TermuXpert - Development Tools Setup Script

echo "Installing development tools..."

# Update package list and install tools
pkg update -y && pkg upgrade -y
pkg install -y git python nodejs

# Optional: Set up Python virtual environments
pkg install -y python-venv
echo "Development tools installed: Git, Python, Node.js"

# Display git configuration help
echo "Don't forget to set up Git with:"
echo "git config --global user.name 'Your Name'"
echo "git config --global user.email 'you@example.com'"
