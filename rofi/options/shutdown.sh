#!/bin/bash
set -euo pipefail

source "$HOME/.config/rofi/lib.sh"

if confirm "Shutdown now?"; then
  systemctl poweroff
fi
