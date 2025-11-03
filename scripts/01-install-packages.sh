#!/bin/bash
set -e
source "$1/scripts/00-common.sh"
log_step "Installing official repository packages"

PACKAGES=(
    "acl"
    "uwsm"
    "sway"
    "swaybg"
    "swaylock"
    "foot"
    "nano"
    "base-devel"
    "git"
    "rustup"
    "rofi"
    "nvidia-open"
    "nvidia-utils"
    "xorg-xwayland"
    "vulkan-swrast"
    "firefox"
    "gnome-keyring"
    "libsecret"
    "filezilla"
)

sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed "${PACKAGES[@]}"

rustup default stable

log_info "Packages installed successfully"
