# Aliases for TermuXpert

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# TermuXpert paths
alias termuxpert='cd ~/TermuXpert'
alias termuxpertbin='cd ~/TermuXpert/bin'
alias termuxpertconfig='cd ~/TermuXpert/config'

# List files with color and details
alias l='ls -lh --color=auto'
alias ll='ls -lha --color=auto'

# Common Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git pull'
alias gpush='git push'

# Docker aliases
alias dockerps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

# Networking aliases
alias myip='curl ipinfo.io/ip'

# Miscellaneous
alias c='clear'
alias h='history'
alias reload='source ~/.bashrc'

# Custom commands
alias update='pkg update && pkg upgrade'
alias cls='clear'

# Example:
# alias myalias='some_command --with-options'
