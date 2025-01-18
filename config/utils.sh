#!/data/data/com.termux/files/usr/bin/bash

# Clear screen function
clear_screen() {
    printf "\033c"
}

# Display TermuXpert logo
display_logo() {
    echo -e "${NEON_PINK}"
    echo -e "                                                                                                                  "
    echo -e " _________  _______   ________  _____ ______   ___  ___     ___    ___ ________  _______   ________  _________    "
    echo -e "|\___   ___\\  ___ \ |\   __  \|\   _ \  _   \|\  \|\  \   |\  \  /  /|\   __  \|\  ___ \ |\   __  \|\___   ___\  "
    echo -e "\|___ \  \_\ \   __/|\ \  \|\  \ \  \\\__\ \  \ \  \\\  \  \ \  \/  / | \  \|\  \ \   __/|\ \  \|\  \|___ \  \_|  "
    echo -e "     \ \  \ \ \  \_|/_\ \   _  _\ \  \\|__| \  \ \  \\\  \  \ \    / / \ \   ____\ \  \_|/_\ \   _  _\   \ \  \   "
    echo -e "      \ \  \ \ \  \_|\ \ \  \\  \\ \  \    \ \  \ \  \\\  \  /     \/   \ \  \___|\ \  \_|\ \ \  \\  \|   \ \  \  "
    echo -e "       \ \__\ \ \_______\ \__\\ _\\ \__\    \ \__\ \_______\/  /\   \    \ \__\    \ \_______\ \__\\ _\    \ \__\ "
    echo -e "        \|__|  \|_______|\|__|\|__|\|__|     \|__|\|_______/__/ /\ __\    \|__|     \|_______|\|__|\|__|    \|__| "
    echo -e "                                                          |__| /  \|__|                                           "
    echo -e "                                                                                                                  "
    echo -e "                                                                                                                  "
    echo -e "${RESET}"
}


# Loading animation
show_loading() {
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


# Show task status
show_task() {
    local task=$1
    local status=$2
    
    case $status in
        "start")
            echo -e "${YELLOW}[RUNNING]${RESET} $task"
            ;;
        "success")
            echo -e "${GREEN}[DONE]${RESET} $task"
            ;;
        "fail")
            echo -e "${RED}[FAILED]${RESET} $task"
            ;;
    esac
}
