#!/bin/bash
# TermuXpert - Personal Server Setup Script

# Update and install necessary packages
echo "Updating packages and installing necessary tools..."
pkg update -y && pkg upgrade -y
pkg install -y openssh apache2

# Start the Apache web server
echo "Starting Apache server..."
apachectl start

# Display SSH connection instructions
echo "Your personal server is now set up!"
echo "To access it, use the following SSH command:"
echo "ssh your-username@$(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d/ -f1)"

echo "Apache server is running on port 8080. Visit http://localhost:8080"
