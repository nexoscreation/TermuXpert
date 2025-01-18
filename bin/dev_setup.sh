#!/data/data/com.termux/files/usr/bin/bash

# Import the configuration file
source "$HOME/termuxpert/config.sh"

# Function to check if a package is installed
is_package_installed() {
    pkg list-installed | grep -q "^$1" && return 0 || return 1
}

# Function to install Python development tools
setup_python() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up Python development environment..."
    if ! is_package_installed python; then
        pkg install python -y
    fi
    if ! pip show ipython &>/dev/null; then
        pip install ipython pylint black
    fi
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Python development tools installed."
}

# Function to install Node.js and npm
setup_nodejs() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up Node.js development environment..."
    if ! is_package_installed nodejs; then
        pkg install nodejs -y
    fi
    node -v
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Node.js and npm installed with leatest version."
}

# Function to install and configure Git
setup_git() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up Git..."
    if ! is_package_installed git; then
        pkg install git -y
    fi
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    git config --global core.editor nano
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Git installed and configured."
}

# Function to install C/C++ development tools
setup_cpp() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up C/C++ development environment..."
    if ! is_package_installed clang; then
        pkg install clang -y
    fi
    if ! is_package_installed make; then
        pkg install make -y
    fi
    if ! is_package_installed cmake; then
        pkg install cmake -y
    fi
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "C/C++ development tools installed."
}

# Function to install Ruby and Rails
setup_ruby() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up Ruby and Rails development environment..."
    if ! is_package_installed ruby; then
        pkg install ruby -y
    fi
    gem install rails
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Ruby and Rails installed."
}

# Function to install Java development tools
setup_java() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up Java development environment..."
    if ! is_package_installed openjdk-17; then
        pkg install openjdk-17 -y
    fi
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Java development tools installed."
}

# Function to install Go development tools
setup_go() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting up Go development environment..."
    if ! is_package_installed golang; then
        pkg install golang -y
    fi
    # Check and modify ~/.bashrc only if necessary
    if ! grep -q "export GOPATH=\$HOME/go" ~/.bashrc; then
        echo 'export GOPATH=$HOME/go' >> ~/.bashrc
        echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
        source ~/.bashrc
    fi
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Go development tools installed."
}


# Main menu function with user confirmation before installation
show_menu() {
    clear
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Development Environment Setup"
    echo "1. Set up Python development environment"
    echo "2. Set up Node.js development environment"
    echo "3. Set up Git"
    echo "4. Set up C/C++ development environment"
    echo "5. Set up Ruby and Rails development environment"
    echo "6. Set up Java development environment"
    echo "7. Set up Go development environment"
    echo "8. Return to main menu"
    echo
    read -p "Enter your choice [1-8]: " choice
}

# Main function
main() {
    while true; do
        show_menu
        case $choice in
            1) setup_python ;;
            2) setup_nodejs ;;
            3) setup_git ;;
            4) setup_cpp ;;
            5) setup_ruby ;;
            6) setup_java ;;
            7) setup_go ;;
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