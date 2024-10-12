#!/bin/bash
# TermuXpert - Terminal Customization Script

clear
echo "======================================"
echo "     TermuXpert Terminal Customizer   "
echo "======================================"

echo "Choose a customization option:"
echo "1. Install Zsh and Oh-My-Zsh"
echo "2. Apply Terminal Themes"
echo "3. Set Up Aliases"
read -p "Select an option: " customize_option

case $customize_option in
  1) pkg install -y zsh && chsh -s zsh && echo "Zsh installed and set as default shell." ;;
  2) ~/ninjaos-termux/config/themes.sh ;;
  3) ~/ninjaos-termux/config/aliases.sh ;;
  *) echo "Invalid option." ;;
esac