# ninja-theme.zsh

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

# Add aliases
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Other custom configurations...
