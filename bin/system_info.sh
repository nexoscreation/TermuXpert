#!/data/data/com.termux/files/usr/bin/bash

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Function to fetch system information safely
get_system_info() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "System Information:"
    echo "------------------------"
    
    # Fetching Termux version
    TERMUX_VERSION=$(termux-info | grep VERSION)
    print_info "$TERMUXPERT_COLOR_YELLOW" "Termux Version: $TERMUX_VERSION"

    # Fetching Android version
    ANDROID_VERSION=$(getprop ro.build.version.release)
    print_info "$TERMUXPERT_COLOR_YELLOW" "Android Version: $ANDROID_VERSION"

    # Fetching device model
    DEVICE_MODEL=$(getprop ro.product.model)
    print_info "$TERMUXPERT_COLOR_YELLOW" "Device Model: $DEVICE_MODEL"

    # CPU architecture and kernel
    CPU_ARCH=$(uname -m)
    KERNEL_VERSION=$(uname -r)
    print_info "$TERMUXPERT_COLOR_YELLOW" "CPU Architecture: $CPU_ARCH"
    print_info "$TERMUXPERT_COLOR_YELLOW" "Kernel Version: $KERNEL_VERSION"

    # Memory and Storage info
    RAM_TOTAL=$(free -h | awk '/^Mem:/ {print $2}')
    RAM_AVAILABLE=$(free -h | awk '/^Mem:/ {print $7}')
    STORAGE_TOTAL=$(df -h | awk '$NF=="/" {print $2}')
    STORAGE_AVAILABLE=$(df -h | awk '$NF=="/" {print $4}')
    print_info "$TERMUXPERT_COLOR_YELLOW" "Total RAM: $RAM_TOTAL"
    print_info "$TERMUXPERT_COLOR_YELLOW" "Available RAM: $RAM_AVAILABLE"
    print_info "$TERMUXPERT_COLOR_YELLOW" "Total Storage: $STORAGE_TOTAL"
    print_info "$TERMUXPERT_COLOR_YELLOW" "Available Storage: $STORAGE_AVAILABLE"

    # CPU Cores and Temperature
    CPU_CORES=$(nproc)
    CPU_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp 2>/dev/null | awk '{print $1/1000}')
    print_info "$TERMUXPERT_COLOR_YELLOW" "CPU Cores: $CPU_CORES"
    if [ -n "$CPU_TEMP" ]; then
        print_info "$TERMUXPERT_COLOR_YELLOW" "CPU Temperature: $CPU_TEMP°C"
    else
        print_info "$TERMUXPERT_COLOR_YELLOW" "CPU Temperature: N/A"
    fi

    # Battery Level
    BATTERY_LEVEL=$(termux-battery-status | jq -r '.percentage' 2>/dev/null)
    if [ -n "$BATTERY_LEVEL" ]; then
        print_info "$TERMUXPERT_COLOR_YELLOW" "Battery Level: $BATTERY_LEVEL%"
    else
        print_info "$TERMUXPERT_COLOR_YELLOW" "Battery Level: N/A"
    fi

    # IP Address
    IP_ADDRESS=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
    print_info "$TERMUXPERT_COLOR_YELLOW" "IP Address: $IP_ADDRESS"
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