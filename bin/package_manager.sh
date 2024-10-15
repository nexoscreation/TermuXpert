#!/data/data/com.termux/files/usr/bin/bash

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Function to update package lists
update_packages() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Updating package lists..."
    if pkg update -y; then
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Package lists updated successfully."
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to update package lists."
    fi
}

# Function to upgrade installed packages
upgrade_packages() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Upgrading installed packages..."
    if pkg upgrade -y; then
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Packages upgraded successfully."
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to upgrade packages."
    fi
}

# Function to install a package
install_package() {
    read -p "Enter package name to install: " package_name
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Installing $package_name..."
    if pkg install -y "$package_name"; then
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "$package_name installed successfully."
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to install $package_name."
    fi
}

# Function to remove a package
remove_package() {
    read -p "Enter package name to remove: " package_name
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Removing $package_name..."
    if pkg uninstall -y "$package_name"; then
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "$package_name removed successfully."
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Failed to remove $package_name."
    fi
}

# Function to list installed packages
list_packages() {
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Installed Packages:"
    pkg list-installed
}

# Function to search for a package
search_package() {
    read -p "Enter package name to search: " package_name
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Search results for $package_name:"
    pkg search "$package_name"
}

# Main menu
show_menu() {
    clear
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Package Management"
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
            *) termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Invalid option. Please try again." ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main