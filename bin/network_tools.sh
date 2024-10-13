#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

while true; do
    echo -e "${YELLOW}Network Tools:${RESET}"
    echo -e "${CYAN}1.${RESET} Check IP address"
    echo -e "${CYAN}2.${RESET} Ping a host"
    echo -e "${CYAN}3.${RESET} DNS lookup"
    echo -e "${CYAN}4.${RESET} Port scan"
    echo -e "${CYAN}5.${RESET} Network speed test"
    echo -e "${CYAN}6.${RESET} Traceroute"
    echo -e "${CYAN}7.${RESET} Return to main menu"
    read -p "Select an option: " net_choice

    case $net_choice in
        1) echo "IP Address: $(curl -s ifconfig.me)" ;;
        2) 
            read -p "Enter hostname or IP to ping: " ping_host
            ping -c 4 $ping_host
            ;;
        3)
            if ! command -v nslookup &> /dev/null; then
                echo "dnsutils is not installed. Installing..."
                pkg install dnsutils -y
            fi
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
            echo "This tool currently unavailable."
            ;;
        6)
            if ! command -v traceroute &> /dev/null; then
                echo "traceroute is not installed. Installing..."
                pkg install traceroute -y
            fi
            read -p "Enter hostname or IP for traceroute: " trace_host
            traceroute $trace_host
            ;;
        7) exit 0 ;;
        *) echo -e "${RED}Invalid choice. Please try again.${RESET}" ;;
    esac
    echo ""
    read -n 1 -s -r -p "$(echo -e ${RED}Press any key to continue...${RESET} )"
    echo ""
done