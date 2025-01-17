#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Install Zsh
print_color "$YELLOW" "Installing Zsh..."
pkg install zsh -y

# Install Oh My Zsh
print_color "$YELLOW" "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Zsh plugins
print_color "$YELLOW" "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Configure Zsh
print_color "$YELLOW" "Configuring Zsh..."
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc

# Add custom configuration
cat << EOF >> ~/.zshrc

# Custom configuration
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# Custom prompt with NinjaOS styling
ninja_prompt() {
  PROMPT="%F{cyan}%n%f@%F{green}%m%f %F{yellow}%~%f %F{red}$%f "
}

# Load the custom prompt
ninja_prompt

# Set custom colors
autoload -U colors && colors
PROMPT="%F{cyan}%n%f@%F{green}%m%f %F{yellow}%~%f %F{red}$%f "
ZSH_THEME_GIT_PROMPT_PREFIX="%F{blue}git:(%F{magenta}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue})%f "

# Load custom aliases
if [ -f ~/.zsh_aliases ]; then
    source ~/.zsh_aliases
fi
EOF

# Create custom aliases file
print_color "$YELLOW" "Creating custom aliases file..."
cat << EOF > ~/.zsh_aliases
# Custom aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias update='pkg update && pkg upgrade'
alias cls='clear'
alias zshconfig='nano ~/.zshrc'
alias ohmyzsh='nano ~/.oh-my-zsh'
EOF

# Set Zsh as default shell
print_color "$YELLOW" "Setting Zsh as default shell..."
chsh -s zsh

print_color "$GREEN" "Zsh setup complete! Please restart Termux to apply changes."