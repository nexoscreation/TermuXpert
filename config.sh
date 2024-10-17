#!/data/data/com.termux/files/usr/bin/bash

# TermuXpert Configuration File

# Color definitions
export TERMUXPERT_COLOR_RED='\033[0;31m'
export TERMUXPERT_COLOR_GREEN='\033[0;32m'
export TERMUXPERT_COLOR_YELLOW='\033[1;33m'
export TERMUXPERT_COLOR_BLUE='\033[0;34m'
export TERMUXPERT_COLOR_MAGENTA='\033[0;35m'
export TERMUXPERT_COLOR_CYAN='\033[0;36m'
export TERMUXPERT_COLOR_RESET='\033[0m'

# Directories
export TERMUXPERT_ROOT_DIR="$HOME/termuxpert"
export TERMUXPERT_BIN_DIR="$TERMUXPERT_ROOT_DIR/bin"
export TERMUXPERT_CONFIG_DIR="$TERMUXPERT_ROOT_DIR/config"
export TERMUXPERT_BACKUP_DIR="$HOME/termux_backups"

# Version
export TERMUXPERT_VERSION="1.0.0"

# Default settings
export TERMUXPERT_DEFAULT_EDITOR="nano"
export TERMUXPERT_DEFAULT_SHELL="bash"

# Language settings
export TERMUXPERT_LANG="en"  # Default language

# Function to print colored output
termuxpert_print_color() {
    echo -e "${1}${2}${TERMUXPERT_COLOR_RESET}"
}

# Function to run a command and handle errors
termuxpert_run_command() {
    local cmd="$1"
    local error_msg="$2"
    
    if ! eval "$cmd"; then
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Error: $error_msg"
        return 1
    fi
    return 0
}

# Function to load language strings
# load_language() {
#    local lang_file="$TERMUXPERT_ROOT_DIR/locales/${TERMUXPERT_LANG}.sh"
#    if [ -f "$lang_file" ]; then
#        source "$lang_file"
#    else
#        echo "Error: Language file not found. Falling back to English."
#        source "$TERMUXPERT_ROOT_DIR/locales/en.sh"
#    fi
# }
#
# Load language strings
#load_language