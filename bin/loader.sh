#!/bin/bash

# Function to get the center position of the terminal
get_center_position() {
  local term_width
  term_width=$(tput cols)
  local center_position=$((term_width / 2))
  echo $center_position
}

# Function for the loading animation
loading_animation() {
  local center_position
  center_position=$(get_center_position)

  spinner="/|\\-/|\\-"
  while true; do
    for i in $(seq 0 7); do
      printf "\e[1;95m%*s\e[0m\r" $center_position "[${spinner:$i:1}] Loading..."
      sleep 0.1
    done
  done
}

# Start the loading animation
loading_animation
