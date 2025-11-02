#!/bin/bash

set -e
source "$1/scripts/00-common.sh"
log_step "Installing Paru"

cd /tmp
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si --noconfirm
cd ..


# Cleanup
rm -rf paru go

log_info "Paru installed successfully"
