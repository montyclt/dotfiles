#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

pkg=$(paru -Slq | rofi -dmenu -i -p "Install AUR package") || exit 0
[[ -z "${pkg}" ]] && exit 0

run_in_term "paru -S --needed \"${pkg}\""
