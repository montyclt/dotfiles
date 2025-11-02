#!/bin/bash

set -e
source "$1/scripts/00-common.sh"
log_step "Configuring autologin on TTY1"

sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin ${USER} --noclear %I \$TERM
EOF

log_info "Autologin configured"
