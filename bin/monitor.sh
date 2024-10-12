#!/bin/bash
# TermuXpert - System Monitoring Tools

# Display CPU, Memory, and Disk Usage
echo "==============================="
echo "      System Monitoring"
echo "==============================="
echo "CPU Info:"
lscpu
echo
echo "Memory Usage:"
free -h
echo
echo "Disk Usage:"
df -h
echo

# Network information
echo "Network Information:"
ifconfig
