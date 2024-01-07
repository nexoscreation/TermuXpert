#!/bin/bash

source ./config/colors.sh
source ./bin/style.sh

# Function to display the header
display_header() {
  local terminal_width
  terminal_width=$(get_terminal_width)

  # Calculate the number of characters needed for the line
  local line_length=$((terminal_width - 14 - ${#current_dir}))  # Adjust as needed

  # Construct the line with the current directory
  local line="└────╼❯[ NINJA OS ]/$(printf '─%.0s' $(seq 1 $line_length))"

  # Display the header
  echo -e "${WHITE}${Green}${line}${Reset}"
}

# Display the header
display_header
