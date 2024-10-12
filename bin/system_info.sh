#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo -e "${YELLOW}System Information:${RESET}"
echo -e "${CYAN}Termux Version:${RESET} $(termux-info | grep VERSION)"
echo -e "${CYAN}Android Version:${RESET} $(getprop ro.build.version.release)"
echo -e "${CYAN}Device Model:${RESET} $(getprop ro.product.model)"
echo -e "${CYAN}CPU Architecture:${RESET} $(uname -m)"
echo -e "${CYAN}Total RAM:${RESET} $(free -h | awk '/^Mem:/ {print $2}')"
echo -e "${CYAN}Available Storage:${RESET} $(df -h | awk '$NF=="/" {print $4}')"
echo -e "${CYAN}Kernel Version:${RESET} $(uname -r)"
echo -e "${CYAN}CPU Cores:${RESET} $(nproc)"
echo -e "${CYAN}Battery Status:${RESET} $(termux-battery-status | jq -r '.percentage')%"
echo -e "${CYAN}IP Address:${RESET} $(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')"