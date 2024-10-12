#!/bin/bash
echo "NinjaOS System Information"
echo "--------------------------"
uname -a
echo "CPU: $(cat /proc/cpuinfo | grep 'model name' | uniq)"
echo "Memory: $(free -h | awk '/Mem/ {print $2}')"
