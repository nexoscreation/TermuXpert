#!/bin/bash

# Source the common file is available
source ./bin/style.sh

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
sleep 18
}

# Start the loading animation
loading_animation
