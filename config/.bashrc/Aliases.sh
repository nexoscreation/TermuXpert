# Aliases for TermuXpert

# TermuXpert paths
alias termuxpert='cd ~/TermuXpert'
alias termuxpertbin='cd ~/TermuXpert/bin'
alias termuxpertconfig='cd ~/TermuXpert/config'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List directories
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# System
alias update='pkg update && pkg upgrade'
alias clean='pkg clean'

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpush='git push'
alias gl='git log --oneline --graph --decorate'

# Docker aliases
alias dockerps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

# Networking aliases
alias myip='curl ipinfo.io/ip'

# Miscellaneous
alias c='clear'
alias h='history'
alias j='jobs -l'
alias reload='source ~/.bashrc'

# Custom commands
alias update='pkg update && pkg upgrade'

# Example:
# alias myalias='some_command --with-options'
