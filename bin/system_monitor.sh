#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo -e "${YELLOW}System Monitoring:${RESET}"
echo "Press Ctrl+C to stop monitoring."
echo ""

while true; do
    clear
    echo -e "${CYAN}Date and Time:${RESET} $(date)"
    echo -e "${CYAN}Uptime:${RESET} $(uptime -p)"
    echo ""
    
    echo -e "${CYAN}CPU Usage:${RESET}"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *$$[0-9.]*$$%* id.*/\1/" | awk '{print 100 - $1"%"}'
    echo ""
    
    echo -e "${CYAN}Memory Usage:${RESET}"
    free -m | awk 'NR==2{printf "Total: %sMB, Used: %sMB, Free: %sMB\n", $2,$3,$4 }'
    echo ""
    
    echo -e "${CYAN}Disk Usage:${RESET}"
    df -h | grep '/data/data/com.termux/files'
    echo ""
    
    echo -e "${CYAN}Network Statistics:${RESET}"
    ifconfig | grep -E "RX packets|TX packets"
    echo ""
    
    echo -e "${CYAN}Top 5 CPU-consuming processes:${RESET}"
    ps aux --sort=-%cpu | head -n 6
    echo ""
    
    sleep 2
done