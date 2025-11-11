#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

if confirm "Reboot into UEFI firmware setup?"; then
  systemctl reboot --firmware-setup
fi
