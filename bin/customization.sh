#!/bin/bash
# TermuXpert - Terminal Customization Script

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
