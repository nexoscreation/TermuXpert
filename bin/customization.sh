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

# Function to set termux scheme
set_termux_scheme() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting custom Termux scheme..."

    # Define the path to your existing config directory where termux.properties is stored
    CONFIG_DIR="$HOME/termuxpert/config"  # Modify this path if needed
    TERMUX_FILE="$CONFIG_DIR/termux/termux.properties"

    # Check if the termux.properties file exists in the config directory
    if [ -f "$TERMUX_FILE" ]; then
        mkdir -p ~/.termux
        cp "$TERMUX_FILE" ~/.termux/termux.properties
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Custom Termux scheme set from the config file. Restart Termux to apply changes."
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Error: termux.properties file not found in the config directory!"
    fi
}

# Function to set up Zsh and Oh My Zsh
setup_zsh() {
    if install_package zsh; then
        if [ ! -d "$HOME/.oh-my-zsh" ]; then
            termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Installing Oh My Zsh..."
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
            termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Oh My Zsh installed successfully."
        else
            termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Oh My Zsh is already installed."
        fi
        chsh -s zsh
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Zsh is now your default shell. Please restart Termux to apply changes."
    fi
}

# Function to set custom color scheme
set_color_scheme() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Setting custom color scheme..."

    # Define the path to your existing config directory where colors.properties is stored
    CONFIG_DIR="$HOME/termuxpert/config"  # Modify this path if needed
    COLORS_FILE="$CONFIG_DIR/termux/colors.properties"

    # Check if the colors.properties file exists in the config directory
    if [ -f "$COLORS_FILE" ]; then
        mkdir -p ~/.termux
        cp "$COLORS_FILE" ~/.termux/colors.properties
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Custom color scheme set from the config file. Restart Termux to apply changes."
    else
        termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Error: colors.properties file not found in the config directory!"
    fi
}


# Function to configure extra keys
configure_extra_keys() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Configuring extra keys..."
    mkdir -p ~/.termux
    cat > ~/.termux/termux.properties << EOF
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
EOF
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Extra keys configured. Restart Termux to apply changes."
}

# Function to install and configure Vim
setup_vim() {
    if install_package vim; then
        termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Configuring Vim..."
        cat > ~/.vimrc << EOF
set number
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
syntax on
colorscheme desert
EOF
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Vim configured successfully."
    fi
}

# Function to install and configure Tmux
setup_tmux() {
    if install_package tmux; then
        termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Configuring Tmux..."
        cat > ~/.tmux.conf << EOF
set -g mouse on
set -g history-limit 10000
set -g default-terminal "screen-256color"
EOF
        termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Tmux configured successfully."
    fi
}

# Function to install custom fonts
install_custom_fonts() {
    termuxpert_print_color "$TERMUXPERT_COLOR_YELLOW" "Installing custom fonts..."
    mkdir -p ~/.termux/font
    curl -fLo ~/.termux/font/DejaVu.ttf --create-dirs https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Custom font installed. Restart Termux to apply changes."
}

# Main menu
show_menu() {
    clear
    termuxpert_print_color "$TERMUXPERT_COLOR_CYAN" "Termux Customization"
    echo "1. Set Termux Configure"
    echo "2. Set up Zsh and Oh My Zsh"
    echo "3. Set custom color scheme"
    echo "4. Configure extra keys"
    echo "5. Install and configure Vim"
    echo "6. Install and configure Tmux"
    echo "7. Install custom fonts"
    echo "8. Return to main menu"
    echo
    read -p "Enter your choice [1-7]: " choice
}

# Main function
main() {
    while true; do
        show_menu
        case $choice in
            1) set_termux_scheme ;;
            2) setup_zsh ;;
            3) set_color_scheme ;;
            4) configure_extra_keys ;;
            5) setup_vim ;;
            6) setup_tmux ;;
            7) install_custom_fonts ;;
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