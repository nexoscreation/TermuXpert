#!/bin/bash

# Function for the loading animation
loading_animation() {
  spinner="/|\\-/|\\-"
  while true; do
    for i in $(seq 0 7); do
      echo -ne "\e[1;95m\r[${spinner:$i:1}] Loading... \e[0m"
      sleep 0.1
    done
  done
}

# Start the loading animation
loading_animation
