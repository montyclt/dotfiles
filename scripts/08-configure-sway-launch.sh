#!/bin/bash

set -e
source "$1/scripts/00-common.sh"
log_step "Adding auto-sway to ~/.bashrc"

BASHRC="$HOME/.bashrc"

[ -f "$BASHRC" ] || touch "$BASHRC"
cat >> "$BASHRC" <<'EOF'
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec dbus-run-session sway
fi
EOF

log_info "Auto-sway block appended"
