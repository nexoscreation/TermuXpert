#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

print_color "$YELLOW" "TermuXpert Termux Information Script"

# Termux version
print_color "$CYAN" "Termux Version:"
termux-info | grep VERSION

# Android version
print_color "$CYAN" "Android Version:"
getprop ro.build.version.release

# Device model
print_color "$CYAN" "Device Model:"
getprop ro.product.model

# CPU information
print_color "$CYAN" "CPU Information:"
lscpu | grep "Model name"

# Memory information
print_color "$CYAN" "Memory Information:"
free -h

# Storage information
print_color "$CYAN" "Storage Information:"
df -h /data

# Network information
print_color "$CYAN" "Network Information:"
ip addr show | grep inet

# Installed packages
print_color "$CYAN" "Number of Installed Packages:"
pkg list-installed | wc -l

# Shell information
print_color "$CYAN" "Current Shell:"
echo $SHELL

print_color "$GREEN" "Termux information gathering completed!"