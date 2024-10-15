#!/data/data/com.termux/files/usr/bin/bash

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Function to check if a package is installed
is_package_installed() {
    if pkg list-installed | grep -q "^$1"; then
        return 0
    else
        return 1
    fi
}

# Function to install a package if not already installed
install_package() {
    if ! is_package_installed "$1"; then
        termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Installing $1..."
        if pkg install "$1" -y; then
            termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "$1 installed successfully."
        else
            termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to install $1. Please check your internet connection and try again."
            return 1
        fi
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "$1 is already installed."
    fi
    return 0
}

# Function to generate SSH key
generate_ssh_key() {
    read -p "Enter your email for the SSH key: " email
    ssh-keygen -t ed25519 -C "$email"
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "SSH key generated successfully."
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Your public key:"
    cat ~/.ssh/id_ed25519.pub
}

# Function to set up two-factor authentication
setup_2fa() {
    if install_package google-authenticator; then
        google-authenticator
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Two-factor authentication set up. Follow the instructions above."
    fi
}

# Function to encrypt a file
encrypt_file() {
    if install_package gnupg; then
        read -p "Enter the file to encrypt: " file_to_encrypt
        if [ -f "$file_to_encrypt" ]; then
            gpg -c "$file_to_encrypt"
            termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "File encrypted successfully."
        else
            termuxpert_print_color "$TERMUXPERT_COLOR_RED" "File not found."
        fi
    fi
}

# Function to decrypt a file
decrypt_file() {
    if install_package gnupg; then
        read -p "Enter the file to decrypt: " file_to_decrypt
        if [ -f "$file_to_decrypt" ]; then
            gpg "$file_to_decrypt"
            termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "File decrypted successfully."
        else
            termuxpert_print_color "$TERMUXPERT_COLOR_RED" "File not found."
        fi
    fi
}

# Function to scan for open ports
scan_ports() {
    if install_package nmap; then
        read -p "Enter the IP address to scan: " ip_to_scan
        nmap "$ip_to_scan"
    fi
}

# Function to check for system updates
check_updates() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Checking for system updates..."
    pkg update -y
    pkg upgrade -y
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "System updated successfully."
}

# Function to set up a firewall
setup_firewall() {
    if install_package iptables; then
        termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up basic firewall rules..."
        iptables -F
        iptables -X
        iptables -P INPUT DROP
        iptables -P FORWARD DROP
        iptables -P OUTPUT ACCEPT
        iptables -A INPUT -i lo -j ACCEPT
        iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
        iptables -A INPUT -p tcp --dport 22 -j ACCEPT
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Basic firewall rules set up."
    fi
}

# Main menu
show_menu() {
    clear
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Security Tools"
    echo "1. Generate SSH key"
    echo "2. Set up two-factor authentication"
    echo "3. Encrypt a file"
    echo "4. Decrypt a file"
    echo "5. Scan for open ports"
    echo "6. Check for system updates"
    echo "7. Set up basic firewall"
    echo "8. Return to main menu"
    echo
    read -p "Enter your choice [1-8]: " choice
}

# Main function
main() {
    while true; do
        show_menu
        case $choice in
            1) generate_ssh_key ;;
            2) setup_2fa ;;
            3) encrypt_file ;;
            4) decrypt_file ;;
            5) scan_ports ;;
            6) check_updates ;;
            7) setup_firewall ;;
            8) return ;;
            *)
                termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Invalid option. Please try again."
                ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main