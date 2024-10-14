#!/data/data/com.termux/files/usr/bin/bash

# ANSI color codes
NEON_PINK='\033[38;2;255;20;147m'
RESET='\033[0m'

# Horizontal logo
horizontal_logo() {
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

# Landscape logo
landscape_logo() {
    echo -e "${NEON_PINK}"
    echo "  ___________                         "
    echo " |_   _|  ___|                        "
    echo "   | | | |__  _ __ _ __ ___  _   ___  "
    echo "   | | |  __|| '__| '_ \` _ \| | | \ \ / / "
    echo "   | | | |___| |  | | | | | | |_| |\ V /  "
    echo "   \_/ \____/|_|  |_| |_| |_|\__,_| \_/   "
    echo "    _____                     _           "
    echo "   | ___ \                   | |          "
    echo "   | |_/ /__ _ __   ___ _ __ | |_         "
    echo "   |  __/ _ \ '_ \ / _ \ '_ \| __|        "
    echo "   | | |  __/ |_) |  __/ | | | |_         "
    echo "   \_|  \___| .__/ \___|_| |_|\__|        "
    echo "            | |                           "
    echo "            |_|                           "
    echo -e "${RESET}"
}
