#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

while true; do
    echo -e "${YELLOW}Network Tools:${RESET}"
    echo "1. Check IP address"
    echo "2. Ping a host"
    echo "3. DNS lookup"
    echo "4. Port scan"
    echo "5. Network speed test"
    echo "6. Traceroute"
    echo "7. Return to main menu"
    read -p "Select an option: " net_choice

    case $net_choice in
        1) echo "IP Address: $(curl -s ifconfig.me)" ;;
        2) 
            read -p "Enter hostname or IP to ping: " ping_host
            ping -c 4 $ping_host
            ;;
        3)
            read -p "Enter domain name for DNS lookup: " domain
            nslookup $domain
            ;;
        4)
            if ! command -v nmap &> /dev/null; then
                echo "nmap is not installed. Installing..."
                pkg install nmap -y
            fi
            read -p "Enter IP address or hostname to scan: " scan_host
            nmap $scan_host
            ;;
        5)
            if ! command -v speedtest-cli &> /dev/null; then
                echo "speedtest-cli is not installed. Installing..."
                pip install speedtest-cli
            fi
            speedtest-cli
            ;;
        6)
            read -p "Enter hostname or IP for traceroute: " trace_host
            traceroute $trace_host
            ;;
        7) exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "Press any key to continue..."
    echo ""
done