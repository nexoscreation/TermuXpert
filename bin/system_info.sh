#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Function to get system information
get_system_info() {
    print_color "$CYAN" "System Information:"
    echo "------------------------"
    print_color "$YELLOW" "Termux Version: $(termux-info | grep VERSION)"
    print_color "$YELLOW" "Android Version: $(getprop ro.build.version.release)"
    print_color "$YELLOW" "Device Model: $(getprop ro.product.model)"
    print_color "$YELLOW" "CPU Architecture: $(uname -m)"
    print_color "$YELLOW" "Kernel Version: $(uname -r)"
    print_color "$YELLOW" "Total RAM: $(free -h | awk '/^Mem:/ {print $2}')"
    print_color "$YELLOW" "Available RAM: $(free -h | awk '/^Mem:/ {print $7}')"
    print_color "$YELLOW" "Total Storage: $(df -h | awk '$NF=="/" {print $2}')"
    print_color "$YELLOW" "Available Storage: $(df -h | awk '$NF=="/" {print $4}')"
    print_color "$YELLOW" "CPU Cores: $(nproc)"
    print_color "$YELLOW" "CPU Temperature: $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000}')°C"
    print_color "$YELLOW" "Battery Level: $(termux-battery-status | jq -r '.percentage')%"
    print_color "$YELLOW" "IP Address: $(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
}

# Main function
main() {
    clear
    get_system_info
    echo
    print_color "$GREEN" "System information gathered successfully."
    read -n 1 -s -r -p "Press any key to continue..."
}

main