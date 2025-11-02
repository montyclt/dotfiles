#!/bin/bash

set -e

SCRIPT_DIR="$1"
source "$SCRIPT_DIR/scripts/00-common.sh"

log_step "Linking dotfiles"

# Environment files
mkdir -p "$HOME/.config/environment.d"
for f in "$SCRIPT_DIR"/environment/*.conf; do
  [ -e "$f" ] || continue
  ln -sf "$f" "$HOME/.config/environment.d/$(basename "$f")"
done

# Git config
mkdir -p "$HOME/.config/git"
for f in config ignore; do
  [ -e "$SCRIPT_DIR/git/$f" ] || continue
  ln -sf "$SCRIPT_DIR/git/$f" "$HOME/.config/git/$f"
done
[ -e "$HOME/.config/git/config" ] && ln -sf "$HOME/.config/git/config" "$HOME/.gitconfig"

# Sway config
mkdir -p "$HOME/.config/sway"
for f in "$SCRIPT_DIR"/sway/*; do
  [ -e "$f" ] || continue
  ln -sf "$f" "$HOME/.config/sway/$(basename "$f")"
done

# xwaykeyz config
mkdir -p "$HOME/.config/xwaykeyz"
for f in "$SCRIPT_DIR"/xwaykeyz/*; do
  [ -e "$f" ] || continue
  ln -sf "$f" "$HOME/.config/xwaykeyz/$(basename "$f")"
done

# rofi config
mkdir -p "$HOME/.config/rofi"
for f in "$SCRIPT_DIR"/rofi/*; do
  [ -e "$f" ] || continue
  dest="$HOME/.config/rofi/$(basename "$f")"
  ln -sf "$f" "$dest" 2>/dev/null || cat "$f" > "$dest"
done

log_info "Dotfiles linked"
