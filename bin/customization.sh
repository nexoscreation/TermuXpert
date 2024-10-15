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
    mkdir -p ~/.termux
    cat > ~/.termux/colors.properties << EOF
background=#282a36
foreground=#f8f8f2
cursor=#f8f8f2

color0=#000000
color8=#4d4d4d

color1=#ff5555
color9=#ff6e67

color2=#50fa7b
color10=#5af78e

color3=#f1fa8c
color11=#f4f99d

color4=#bd93f9
color12=#caa9fa

color5=#ff79c6
color13=#ff92d0

color6=#8be9fd
color14=#9aedfe

color7=#bfbfbf
color15=#e6e6e6
EOF
    termuxpert_print_color "$TERMUXPERT_COLOR_GREEN" "Custom color scheme set. Restart Termux to apply changes."
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
    echo "1. Set up Zsh and Oh My Zsh"
    echo "2. Set custom color scheme"
    echo "3. Configure extra keys"
    echo "4. Install and configure Vim"
    echo "5. Install and configure Tmux"
    echo "6. Install custom fonts"
    echo "7. Return to main menu"
    echo
    read -p "Enter your choice [1-7]: " choice
}

# Main function
main() {
    while true; do
        show_menu
        case $choice in
            1) setup_zsh ;;
            2) set_color_scheme ;;
            3) configure_extra_keys ;;
            4) setup_vim ;;
            5) setup_tmux ;;
            6) install_custom_fonts ;;
            7) return ;;
            *)
                termuxpert_print_color "$TERMUXPERT_COLOR_RED" "Invalid option. Please try again."
                ;;
        esac
        echo
        read -n 1 -s -r -p "Press any key to continue..."
    done
}

main