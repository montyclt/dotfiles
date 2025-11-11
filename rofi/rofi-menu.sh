#!/bin/bash
set -euo pipefail

# Allow passing a relative menu file (within ~/.config/rofi/) as an optional argument
if [[ $# -ge 1 ]]; then
  MENU_FILE="${HOME}/.config/rofi/$1"
else
  MENU_FILE="${HOME}/.config/rofi/menus/main.conf"
fi

error() {
  rofi -e "$1";
}
trim() {
  sed -E 's/^[[:space:]]+|[[:space:]]+$//g';
}

if [[ ! -f "$MENU_FILE" ]]; then
  error "Menu config not found: $MENU_FILE"
  exit 1
fi

# Build the list of labels from the config (ignore empty lines and comments)
labels=$(grep -v '^[[:space:]]*#' "$MENU_FILE" | sed '/^[[:space:]]*$/d' | sed -E 's/[[:space:]]*\|.*$//' | sed -E 's/^[[:space:]]+|[[:space:]]+$//g')

selection=$(printf '%s\n' "$labels" | rofi -dmenu -i -p "Menu") || exit 0
[[ -z "$selection" ]] && exit 0

# Find the matching script path for the selected label
rel_path=""
while IFS= read -r line; do
  [[ "$line" =~ ^[[:space:]]*$ ]] && continue
  [[ "$line" =~ ^[[:space:]]*# ]] && continue
  label_part="${line%%|*}"
  path_part="${line#*|}"
  [[ "$label_part" == "$line" ]] && continue
  label_part="$(echo "$label_part" | trim)"
  path_part="$(echo "$path_part" | trim)"
  if [[ "$label_part" == "$selection" ]]; then
    rel_path="$path_part"
    break
  fi
done < "$MENU_FILE"

[[ -z "$rel_path" ]] && exit 0

# Resolve and execute the target: if it's a submenu (.conf), re-run this script; if it's a script (.sh), execute it.
resolved_path="${HOME}/.config/rofi/${rel_path}"
if [[ "$rel_path" == *.conf ]]; then
  # Re-enter rofi-menu with the submenu config
  exec bash "$0" "$rel_path"
else
  exec bash "$resolved_path"
fi
