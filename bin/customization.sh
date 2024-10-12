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


# Update termux properties file for better customization
echo "Applying terminal customizations..."

# Set custom prompt and appearance
cat <<EOL >> ~/.bashrc
# Custom prompt
export PS1="[\[\e[32m\]\u@\h\[\e[0m\]]:\w\$ "

# Custom Aliases
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'

# Enable bash completion
source /data/data/com.termux/files/usr/etc/bash.bashrc
EOL

# Reload .bashrc to apply changes
source ~/.bashrc

echo "Customization applied. Please restart Termux to see changes."