#!/bin/bash
set -e
source "$1/scripts/00-common.sh"
log_step "Configuring systemd-boot"

sudo sed -i 's/^timeout .*/timeout menu-force/' /boot/loader/loader.conf

log_info "systemd-boot configured"
