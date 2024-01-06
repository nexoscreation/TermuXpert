#!/bin/bash
if ping -c 1 google.com &> /dev/null; then
    echo "Internet is reachable."
else
    echo "No internet connection."
fi
