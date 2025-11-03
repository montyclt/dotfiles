#!/bin/bash
set -e
source "$1/scripts/00-common.sh"
log_step "Installing Paru"

PACKAGES=(
    "powershell-bin"
    "warp-terminal-bin"
)

cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..
rm -rf paru go
paru -S --noconfirm --needed "${PACKAGES[@]}"

log_info "Paru installed successfully"
