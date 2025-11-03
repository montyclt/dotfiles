#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

pkg=$(pacman -Slq | rofi -dmenu -i -p "Install package") || exit 0
[[ -z "${pkg}" ]] && exit 0

run_in_term "sudo pacman -S --needed \"${pkg}\""
