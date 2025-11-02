#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

if confirm "Reboot now?"; then
  systemctl reboot
fi
