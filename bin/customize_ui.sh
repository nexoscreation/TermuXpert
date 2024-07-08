#!/bin/bash

# Function to customize terminal colors
customize_terminal_colors() {
    echo "Customizing terminal colors..."
    echo "Available color schemes:"
    echo "1. Solarized"
    echo "2. Monokai"
    echo "3. Custom"
    read -p "Choose a color scheme (1-3): " color_choice

    case $color_choice in
        1)
            # Example: Set Solarized colors
            termux-color solarized
            ;;
        2)
            # Example: Set Monokai colors
            termux-color monokai
            ;;
        3)
            # Example: Set custom colors
            echo "Enter custom color values (format: foreground/background):"
            read custom_colors
            termux-color set "$custom_colors"
            ;;
        *)
            echo "Invalid choice. Using default colors."
            ;;
    esac
}

# Function to customize terminal font
customize_terminal_font() {
    echo "Customizing terminal font..."
    echo "Available fonts:"
    echo "1. Ubuntu Mono"
    echo "2. Inconsolata"
    echo "3. Custom"
    read -p "Choose a font (1-3): " font_choice

    case $font_choice in
        1)
            # Example: Set Ubuntu Mono font
            termux-font set "UbuntuMono-R.ttf"
            ;;
        2)
            # Example: Set Inconsolata font
            termux-font set "Inconsolata-Regular.ttf"
            ;;
        3)
            # Example: Set custom font
            echo "Enter path to custom font file (e.g., /path/to/font.ttf):"
            read custom_font_path
            termux-font set "$custom_font_path"
            ;;
        *)
            echo "Invalid choice. Using default font."
            ;;
    esac
}

# Main script logic
echo "NinjaOS UI Customization"

while true; do
    echo "Choose an option:"
    echo "1. Customize terminal colors"
    echo "2. Customize terminal font"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            customize_terminal_colors
            ;;
        2)
            customize_terminal_font
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
