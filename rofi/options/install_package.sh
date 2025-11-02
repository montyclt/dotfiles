#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

pkg=$(rofi -dmenu -i -p "pacman -S") || exit 0
[[ -z "${pkg}" ]] && exit 0

run_in_term "sudo pacman -S --noconfirm --needed \"${pkg}\""