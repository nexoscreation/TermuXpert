#!/bin/bash

# Function to connect to Wi-Fi network
connect_wifi() {
    echo "Connecting to Wi-Fi network..."
    echo "Enter SSID (Wi-Fi name):"
    read ssid
    echo "Enter password:"
    read -s password
    termux-wifi-connect "$ssid" "$password"
}

# Function to enable and configure Bluetooth
configure_bluetooth() {
    echo "Configuring Bluetooth..."
    termux-bluetooth enable
    
    # Example: Scan for devices
    echo "Scanning for Bluetooth devices..."
    termux-bluetooth scan
    
    # Example: Connect to a specific Bluetooth device
    echo "Enter MAC address of Bluetooth device to connect:"
    read mac_address
    termux-bluetooth connect "$mac_address"
}

# Main script logic
echo "NinjaOS Network Customization"

while true; do
    echo "Choose an option:"
    echo "1. Connect to Wi-Fi"
    echo "2. Configure Bluetooth"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            connect_wifi
            ;;
        2)
            configure_bluetooth
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter 1, 2, or 3."
            ;;
    esac
done
