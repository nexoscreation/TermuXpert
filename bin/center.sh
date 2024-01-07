# center.sh
get_center_position() {
  local term_width
  term_width=$(tput cols)
  local center_position=$((term_width / 2))
  echo $center_position
}
