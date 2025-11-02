#!/bin/bash

set -e
source "$1/scripts/00-common.sh"
log_step "Configuring GNOME Keyring in PAM"

sudo tee -a /etc/pam.d/login >/dev/null <<'EOF'
auth       optional     pam_gnome_keyring.so
session    optional     pam_gnome_keyring.so auto_start
EOF

log_info "PAM configured"

#!FIX: This script should add these lines to the file, not replace the whole file.