#!/data/data/com.termux/files/usr/bin/bash

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Function to print colored output
print_color() {
    echo -e "${1}${2}${RESET}"
}

# Function to update package lists
update_packages() {
    print_color "$YELLOW" "Updating package lists..."
    if pkg update -y; then
        print_color "$GREEN" "Package lists updated successfully."
    else
        print_color "$RED" "Failed to update package lists."
    fi
}

# Function to upgrade installed packages
upgrade_packages() {
    print_color "$YELLOW" "Upgrading installed packages..."
    if pkg upgrade -y; then
        print_color "$GREEN" "Packages upgraded successfully."
    else
        print_color "$RED" "Failed to upgrade packages."
    fi
}

# Function to install a package
install_package() {
    read -p "Enter package name to install: " package_name
    print_color "$YELLOW" "Installing $package_name..."
    if pkg install -y "$package_name"; then
        print_color "$GREEN" "$package_name installed successfully."
    else
        print_color "$RED" "Failed to install $package_name."
    fi
}

# Function to remove a package
remove_package() {
    read -p "Enter package name to remove: " package_name
    print_color "$YELLOW" "Removing $package_name..."
    if pkg uninstall -y "$package_name"; then
        print_color "$GREEN" "$package_name removed successfully."
    else
        print_color "$RED" "Failed to remove $package_name."
    fi
}

# Function to list installed packages
list_packages() {
    print_color "$CYAN" "Installed Packages:"
    pkg list-installed
}

# Function to search for a package
search_package() {
    read -p "Enter package name to search: " package_name
    print_color "$CYAN" "Search results for $package_name:"
    pkg search "$package_name"
}

# Main menu
show_menu() {
    clear
    print_color "$CYAN" "Package Management"
    echo "1. Update package lists"
    echo "2. Upgrade installed packages"
    echo "3. Install a package"
    echo "4. Remove a package"
    echo "5. List installed packages"
    echo "6. Search for a package"
    echo "7. Return to main menu"
    echo
    read -p "Enter your choice [1-7]: " choice
}

# Main function
main() {
    while true; do
        show_menu
        case $choice in
            1) update_packages ;;
            2) upgrade_packages ;;
            3) install_package ;;
            4) remove_package ;;
            5) list_packages ;;
            6) search_package ;;
            7) return ;;
            *) print_color "$RED" "Invalid option. Please try again." ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main