#!/bin/bash

# Path to your music file
MUSIC_FILE="./data/1704523429064_track.mp3"

# Check if mpg123 is installed
command -v play >/dev/null 2>&1 || { echo >&2 "player is not installed. Aborting."; exit 1; }

# Play music in the background
play -q "$MUSIC_FILE" &