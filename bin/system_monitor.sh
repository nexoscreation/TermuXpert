#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Function to monitor CPU usage
monitor_cpu() {
    print_color "$CYAN" "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *$$[0-9.]*$$%* id.*/\1/" | awk '{print 100 - $1"%"}'
}

# Function to monitor memory usage
monitor_memory() {
    print_color "$CYAN" "Memory Usage:"
    free -m | awk 'NR==2{printf "Total: %sMB, Used: %sMB, Free: %sMB\n", $2,$3,$4}'
}

# Function to monitor disk usage
monitor_disk() {
    print_color "$CYAN" "Disk Usage:"
    df -h | grep '/data/data/com.termux/files'
}

# Function to monitor network usage
monitor_network() {
    print_color "$CYAN" "Network Usage:"
    rx_bytes_old=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
    tx_bytes_old=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
    sleep 1
    rx_bytes_new=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
    tx_bytes_new=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
    rx_rate=$((rx_bytes_new - rx_bytes_old))
    tx_rate=$((tx_bytes_new - tx_bytes_old))
    echo "Download: $((rx_rate/1024)) KB/s, Upload: $((tx_rate/1024)) KB/s"
}

# Function to monitor battery status
monitor_battery() {
    print_color "$CYAN" "Battery Status:"
    termux-battery-status | jq -r '"Level: \(.percentage)%, Status: \(.status)"'
}

# Function to monitor running processes
monitor_processes() {
    print_color "$CYAN" "Top 5 CPU-consuming processes:"
    ps aux --sort=-%cpu | head -n 6
}

# Main monitoring function
monitor_system() {
    while true; do
        clear
        print_color "$YELLOW" "System Monitoring (Press Ctrl+C to stop)"
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
        sleep 2
    done
}

# Main function
main() {
    monitor_system
}

main