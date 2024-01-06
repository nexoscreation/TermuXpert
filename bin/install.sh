#!/bin/bash

echo "Installing necessary tools for NinjaOS..."

# Example: Install essential packages
pkg update
pkg upgrade
pkg install -y git
pkg install -y nano
pkg install -y zsh
pkg install -y neofetch

# Additional installations or configurations can be added here
# ...

echo "Installation complete!"
