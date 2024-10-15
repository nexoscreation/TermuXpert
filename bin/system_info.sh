#!/data/data/com.termux/files/usr/bin/bash

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Function to get system information
get_system_info() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "System Information:"
    echo "------------------------"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Termux Version: $(termux-info | grep VERSION)"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Android Version: $(getprop ro.build.version.release)"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Device Model: $(getprop ro.product.model)"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "CPU Architecture: $(uname -m)"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Kernel Version: $(uname -r)"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Total RAM: $(free -h | awk '/^Mem:/ {print $2}')"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Available RAM: $(free -h | awk '/^Mem:/ {print $7}')"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Total Storage: $(df -h | awk '$NF=="/" {print $2}')"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Available Storage: $(df -h | awk '$NF=="/" {print $4}')"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "CPU Cores: $(nproc)"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "CPU Temperature: $(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000}')°C"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Battery Level: $(termux-battery-status | jq -r '.percentage')%"
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "IP Address: $(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"
}

# Main function
main() {
    clear
    get_system_info
    echo
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "System information gathered successfully."
    read -n 1 -s -r -p "Press any key to continue..."
}

main