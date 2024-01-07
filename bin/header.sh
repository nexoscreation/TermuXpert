#!/bin/bash

source ./config/colors.sh

# Function to get the width of the terminal
get_terminal_width() {
  tput cols
}

# Function to display the header
display_header() {
  local terminal_width
  terminal_width=$(get_terminal_width)

  local current_dir=$(pwd)  # Replace with the actual current directory

  # Calculate the number of characters needed for the line
  local line_length=$((terminal_width - 14 - ${#current_dir}))  # Adjust as needed

  # Construct the line with the current directory
  local line="└────╼❯[ NINJA OS ]/${current_dir}$(printf '─%.0s' $(seq 1 $line_length))"

  # Display the header
  echo -e "${WHITE}${Cyan}${line}${Reset}"
}

# Display the header
display_header
