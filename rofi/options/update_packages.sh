#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"
run_in_term "sudo pacman -Syu --noconfirm && paru -Syu --noconfirm"