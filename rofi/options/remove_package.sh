#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

pkg=$(rofi -dmenu -i -p "pacman -Rns") || exit 0
[[ -z "${pkg}" ]] && exit 0

if confirm "Remove ${pkg}?"; then
  run_in_term "sudo pacman -Rns --noconfirm \"${pkg}\""
fi
