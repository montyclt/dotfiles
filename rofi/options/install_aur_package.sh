paru#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

pkg=$(rofi -dmenu -i -p "paru -S") || exit 0
[[ -z "${pkg}" ]] && exit 0

run_in_term "paru -S --noconfirm --needed \"${pkg}\""