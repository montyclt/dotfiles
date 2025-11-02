#!/bin/bash

run_in_term() {
  local cmd="$1"
  foot bash -lc "$cmd; echo; echo 'Press Enter to close...'; read -r"
}

confirm() {
  local prompt="$1"
  local ans
  ans=$(printf "No\nYes" | rofi -dmenu -i -sep '\n' -no-custom -p "$prompt") || return 1
  [[ "$ans" = "Yes" ]]
}