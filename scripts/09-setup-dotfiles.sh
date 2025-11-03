#!/bin/bash
set -e
SCRIPT_DIR="$1"
source "$SCRIPT_DIR/scripts/00-common.sh"
log_step "Linking dotfiles"

mkdir -p "$HOME/.config"

# Bashrc
echo "" >> "$HOME/.bashrc"
echo "source \"$SCRIPT_DIR/bash/bashrc\"" >> "$HOME/.bashrc"

# Environment files
ln -sfn "$SCRIPT_DIR/environment" "$HOME/.config/environment.d"

# Git config
ln -sfn "$SCRIPT_DIR/git" "$HOME/.config/git"
[ -e "$HOME/.config/git/config" ] && ln -sf "$HOME/.config/git/config" "$HOME/.gitconfig"

# Sway config
ln -sfn "$SCRIPT_DIR/sway" "$HOME/.config/sway"

# xwaykeyz config
# mkdir -p "/home/keymapper/.config"
# ln -sfn "$SCRIPT_DIR/xwaykeyz" "/home/keymapper/.config/xwaykeyz"
# setfacl -R -m u:keymapper:rX "$SCRIPT_DIR/xwaykeyz"
# setfacl -R -d -m u:keymapper:rX "$SCRIPT_DIR/xwaykeyz"

# rofi config
ln -sfn "$SCRIPT_DIR/rofi" "$HOME/.config/rofi"

log_info "Dotfiles linked"