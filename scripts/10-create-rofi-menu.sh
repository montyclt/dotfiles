#!/bin/bash

set -e
source "$1/scripts/00-common.sh"
log_step "Creating custom Rofi menu script"

BIN_DIR="$HOME/.local/bin"
MENU_SCRIPT="$BIN_DIR/rofi-menu"

mkdir -p "$BIN_DIR"

TARGET="${HOME}/.config/rofi/rofi-menu.sh"
chmod +x "$TARGET" 2>/dev/null || true
ln -sf "$TARGET" "$MENU_SCRIPT"

log_info "Rofi menu linked at $MENU_SCRIPT -> $TARGET"
log_info "Tip: bind a key in sway to run: $MENU_SCRIPT"
