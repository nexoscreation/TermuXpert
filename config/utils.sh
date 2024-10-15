#!/data/data/com.termux/files/usr/bin/bash

# Clear screen function
clear_screen() {
    printf "\033c"
}

# Display TermuXpert logo
display_logo() {
    echo -e "${NEON_PINK}"
    echo "  _______                      __  __                  _   "
    echo " |__   __|                    |  \/  |                | |  "
    echo "    | | ___ _ __ _ __ ___  _  | \  / |_ __   ___ _ __ | |_ "
    echo "    | |/ _ \ '__| '_ \` _ \| | | |\/| | '_ \ / _ \ '__|| __|"
    echo "    | |  __/ |  | | | | | | | | |  | | |_) |  __/ |   | |_ "
    echo "    |_|\___|_|  |_| |_| |_|_| |_|  |_| .__/ \___|_|    \__|"
    echo "                                     | |                   "
    echo "                                     |_|                   "
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
