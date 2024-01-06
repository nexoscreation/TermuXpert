# ninja-theme.bash

# Define color codes
NC='\e[0m'        # No Color
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'
BOLD='\e[1m'

# Set the prompt
PS1="${BOLD}${BLUE}\u${NC}@${BOLD}${YELLOW}\h${NC}:${BOLD}${CYAN}\w${NC}\$ "

# Define custom aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias grep='grep --color=auto'

# Add more aliases and custom configurations as needed
