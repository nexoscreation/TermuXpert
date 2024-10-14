#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# Get terminal size
TERM_ROWS=$(tput lines)
TERM_COLS=$(tput cols)

# Clear screen
clear_screen() {
    tput clear
}

# Move cursor to specific position
move_cursor() {
    tput cup $1 $2
}

# Print centered text
print_centered() {
    local text="$1"
    local row=$2
    local col=$(( (TERM_COLS - ${#text}) / 2 ))
    move_cursor $row $col
    echo -e "$text"
}

# Print bordered text
print_bordered() {
    local text="$1"
    local padding=${2:-1}
    local width=$(( ${#text} + padding * 2 + 2 ))
    local top_border=$(printf '%*s' "$width" | tr ' ' '─')
    local bottom_border=$top_border
    local side_padding=$(printf '%*s' "$padding" )

    echo -e "┌${top_border}┐"
    echo -e "│${side_padding}${text}${side_padding}│"
    echo -e "└${bottom_border}┘"
}

# Create a progress bar
progress_bar() {
    local current=$1
    local total=$2
    local width=${3:-50}
    local percentage=$((current * 100 / total))
    local completed=$((width * current / total))
    local remaining=$((width - completed))

    printf "\rProgress: [%s%s] %d%%" "$(printf '#%.0s' $(seq 1 $completed))" "$(printf ' %.0s' $(seq 1 $remaining))" "$percentage"
}

# Create a simple menu
create_menu() {
    local title="$1"
    shift
    local options=("$@")
    local selected=0

    while true; do
        clear_screen
        print_centered "$title" 2
        echo

        for i in "${!options[@]}"; do
            if [ $i -eq $selected ]; then
                echo -e "${GREEN}> ${options[$i]}${RESET}"
            else
                echo "  ${options[$i]}"
            fi
        done

        read -s -n 1 key
        case "$key" in
            A) # Up arrow
                ((selected--))
                [ "$selected" -lt 0 ] && selected=$((${#options[@]} - 1))
                ;;
            B) # Down arrow
                ((selected++))
                [ "$selected" -ge "${#options[@]}" ] && selected=0
                ;;
            "") # Enter key
                return $selected
                ;;
        esac
    done
}

# Create a text input field
text_input() {
    local prompt="$1"
    local default="$2"
    local input

    echo -n "$prompt"
    read -e -i "$default" input
    echo "$input"
}

# Create a yes/no prompt
yes_no_prompt() {
    local prompt="$1"
    local response

    while true; do
        read -p "$prompt [y/n]: " response
        case $response in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Display a spinner for long-running tasks
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Create a horizontal line
horizontal_line() {
    printf '%*s\n' "${TERM_COLS}" '' | tr ' ' '─'
}

# Create a loading bar
loading_bar() {
    local duration=$1
    local width=${2:-50}
    local interval=$(bc <<< "scale=2; $duration / $width")
    
    for ((i=0; i<=$width; i++)); do
        printf "\rLoading: [%-${width}s] %d%%" "$(printf '#%.0s' $(seq 1 $i))" "$((i * 100 / width))"
        sleep $interval
    done
    echo
}

# Create a countdown timer
countdown_timer() {
    local seconds=$1
    while [ $seconds -gt 0 ]; do
        printf "\rTime remaining: %02d:%02d" $((seconds/60)) $((seconds%60))
        sleep 1
        ((seconds--))
    done
    echo
}

# Create a simple file browser
file_browser() {
    local start_dir="${1:-$PWD}"
    local selected_file=""

    while true; do
        clear_screen
        echo "Current directory: $start_dir"
        echo "------------------------"
        local files=($(ls -1p "$start_dir"))
        create_menu "Select a file or directory:" "${files[@]}"
        local choice=$?

        if [[ -d "$start_dir/${files[$choice]}" ]]; then
            start_dir="$start_dir/${files[$choice]}"
        else
            selected_file="$start_dir/${files[$choice]}"
            break
        fi
    done

    echo "Selected file: $selected_file"
}

# Usage example
# source ui_toolkit.sh
# clear_screen
# print_centered "Welcome to TermuXpert" 2
# horizontal_line
# print_bordered "This is a demo of the UI toolkit" 2
# create_menu "Main Menu" "Option 1" "Option 2" "Option 3" "Exit"
# choice=$?
# echo "You selected option $((choice+1))"
# text_input "Enter your name: " "User"
# yes_no_prompt "Do you want to continue?"
# (sleep 5) & spinner $!
# loading_bar 5
# countdown_timer 10
# file_browser