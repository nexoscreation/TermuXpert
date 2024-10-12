#!/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${YELLOW}===== Termux System Monitor =====${RESET}"

while true; do
    clear
    echo -e "${GREEN}System Information:${RESET}"
    echo "Date and Time: $(date)"
    echo "Uptime: $(uptime -p)"
    echo ""
    
    echo -e "${GREEN}CPU Usage:${RESET}"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *$$[0-9.]*$$%* id.*/\1/" | awk '{print 100 - $1"%"}'
    echo ""
    
    echo -e "${GREEN}Memory Usage:${RESET}"
    free -m | awk 'NR==2{printf "Total: %sMB, Used: %sMB, Free: %sMB\n", $2,$3,$4 }'
    echo ""
    
    echo -e "${GREEN}Disk Usage:${RESET}"
    df -h | grep '/data/data/com.termux/files'
    echo ""
    
    echo -e "${GREEN}Network Connections:${RESET}"
    netstat -ant | awk '{print $6}' | sort | uniq -c | sort -n
    echo ""
    
    echo -e "${YELLOW}Press Ctrl+C to exit${RESET}"
    sleep 5
done