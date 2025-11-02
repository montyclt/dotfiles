#!/bin/bash

set -e
source "$1/scripts/00-common.sh"
log_step "Installing AUR packages"

PACKAGES=(
    "powershell-bin"
    "warp-terminal-bin"
)

paru -S --noconfirm --needed "${PACKAGES[@]}"

log_info "AUR packages installed"