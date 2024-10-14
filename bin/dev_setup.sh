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

# Function to install Python development tools
setup_python() {
    print_color "$YELLOW" "Setting up Python development environment..."
    pkg install python -y
    pip install ipython pylint black
    print_color "$GREEN" "Python development tools installed."
}

# Function to install Node.js and npm
setup_nodejs() {
    print_color "$YELLOW" "Setting up Node.js development environment..."
    pkg install nodejs -y
    npm install -g yarn typescript eslint
    print_color "$GREEN" "Node.js and npm installed with global packages."
}

# Function to install and configure Git
setup_git() {
    print_color "$YELLOW" "Setting up Git..."
    pkg install git -y
    read -p "Enter your Git username: " git_username
    read -p "Enter your Git email: " git_email
    git config --global user.name "$git_username"
    git config --global user.email "$git_email"
    git config --global core.editor nano
    print_color "$GREEN" "Git installed and configured."
}

# Function to install C/C++ development tools
setup_cpp() {
    print_color "$YELLOW" "Setting up C/C++ development environment..."
    pkg install clang -y
    pkg install make -y
    pkg install cmake -y
    print_color "$GREEN" "C/C++ development tools installed."
}

# Function to install Ruby and Rails
setup_ruby() {
    print_color "$YELLOW" "Setting up Ruby and Rails development environment..."
    pkg install ruby -y
    gem install rails
    print_color "$GREEN" "Ruby and Rails installed."
}

# Function to install Java development tools
setup_java() {
    print_color "$YELLOW" "Setting up Java development environment..."
    pkg install openjdk-17 -y
    print_color "$GREEN" "Java development tools installed."
}

# Function to install Go development tools
setup_go() {
    print_color "$YELLOW" "Setting up Go development environment..."
    pkg install golang -y
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc
    echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
    source ~/.bashrc
    print_color "$GREEN" "Go development tools installed."
}

# Main menu
show_menu() {
    clear
    print_color "$CYAN" "Development Environment Setup"
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
                print_color "$RED" "Invalid option. Please try again."
                ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main