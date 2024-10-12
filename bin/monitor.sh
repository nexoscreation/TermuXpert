#!/bin/bash
# TermuXpert - System Monitoring Script

# Display CPU, Memory, and Disk Usage
clear
echo "======================================"
echo "     TermuXpert System Monitoring     "
echo "======================================"

echo "CPU Usage:"
lscpu
echo
echo "Memory Usage:"
free -h m
echo
echo "Disk Storage:"
df -h
echo
echo "Network Usage:"
ifconfig