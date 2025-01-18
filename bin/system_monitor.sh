#!/data/data/com.termux/files/usr/bin/bash

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Function to monitor CPU usage
monitor_cpu() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "CPU Usage:"
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *[0-9.]*%* id.*/\1/" | awk '{print 100 - $1"%"}')
    echo "$cpu_usage"
}

# Function to monitor memory usage
monitor_memory() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Memory Usage:"
    memory_info=$(free -m | awk 'NR==2{printf "Total: %sMB, Used: %sMB, Free: %sMB\n", $2,$3,$4}')
    echo "$memory_info"
}

# Function to monitor disk usage
monitor_disk() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Disk Usage:"
    disk_info=$(df -h | grep '/data/data/com.termux/files')
    echo "$disk_info"
}

# Function to monitor network usage
monitor_network() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Network Usage:"
    
    # Check if the wlan0 interface exists
    if [[ -f /sys/class/net/wlan0/statistics/rx_bytes && -f /sys/class/net/wlan0/statistics/tx_bytes ]]; then
        rx_bytes_old=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
        tx_bytes_old=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
        sleep 1
        rx_bytes_new=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
        tx_bytes_new=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
        rx_rate=$((rx_bytes_new - rx_bytes_old))
        tx_rate=$((tx_bytes_new - tx_bytes_old))
        echo "Download: $((rx_rate/1024)) KB/s, Upload: $((tx_rate/1024)) KB/s"
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Network interface 'wlan0' not found. Please ensure you have network connectivity."
    fi
}

# Function to monitor battery status
monitor_battery() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Battery Status:"
    battery_status=$(termux-battery-status | jq -r '"Level: \(.percentage)%, Status: \(.status), Charging: \(.charging)"')
    echo "$battery_status"
}

# Function to monitor running processes
monitor_processes() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Top 5 CPU-consuming processes:"
    process_list=$(ps aux --sort=-%cpu | head -n 6)
    echo "$process_list"
}

# Main monitoring function
monitor_system() {
    while true; do
        clear
        termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "System Monitoring (Press any key to stop)"
        echo "----------------------------------------"
        monitor_cpu
        echo "----------------------------------------"
        monitor_memory
        echo "----------------------------------------"
        monitor_disk
        echo "----------------------------------------"
        monitor_network
        echo "----------------------------------------"
        monitor_battery
        echo "----------------------------------------"
        monitor_processes
        echo "----------------------------------------"
        sleep 2
        termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Press any key to stop monitoring..."
        read -n 1 -s -r
        break
    done
}

# Main function
main() {
    monitor_system
}

main
