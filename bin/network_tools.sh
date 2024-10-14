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

# Function to check IP address
check_ip() {
    print_color "$CYAN" "IP Address:"
    curl -s ifconfig.me
    echo
}

# Function to ping a host
ping_host() {
    read -p "Enter hostname or IP to ping: " host
    print_color "$YELLOW" "Pinging $host..."
    ping -c 4 "$host"
}

# Function to perform DNS lookup
dns_lookup() {
    read -p "Enter domain name for DNS lookup: " domain
    print_color "$CYAN" "DNS Lookup for $domain:"
    nslookup "$domain"
}

# Function to scan ports
port_scan() {
    if ! command -v nmap &> /dev/null; then
        print_color "$YELLOW" "nmap is not installed. Installing..."
        pkg install nmap -y
    fi
    read -p "Enter IP address or hostname to scan: " target
    print_color "$YELLOW" "Scanning ports for $target..."
    nmap "$target"
}

# Function to perform a network speed test
speed_test() {
    if ! command -v speedtest-cli &> /dev/null; then
        print_color "$YELLOW" "speedtest-cli is not installed. Installing..."
        pip install speedtest-cli
    fi
    print_color "$YELLOW" "Performing speed test..."
    speedtest-cli
}

# Function to perform traceroute
traceroute() {
    read -p "Enter hostname or IP for traceroute: " host
    print_color "$YELLOW" "Performing traceroute to $host..."
    traceroute "$host"
}

# Function to show network interfaces
show_interfaces() {
    print_color "$CYAN" "Network Interfaces:"
    ifconfig
}

# Main menu
show_menu() {
    clear
    print_color "$CYAN" "Network Tools"
    echo "1. Check IP address"
    echo "2. Ping a host"
    echo "3. DNS lookup"
    echo "4. Port scan"
    echo "5. Network speed test"
    echo "6. Traceroute"
    echo "7. Show network interfaces"
    echo "8. Return to main menu"
    echo
    read -p "Enter your choice [1-8]: " choice
}

# Main function
main() {
    while true; do
        show_menu
        case $choice in
            1) check_ip ;;
            2) ping_host ;;
            3) dns_lookup ;;
            4) port_scan ;;
            5) speed_test ;;
            6) traceroute ;;
            7) show_interfaces ;;
            8) return ;;
            *) 
                print_color "$RED" "Invalid option. Please try again."
                ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main