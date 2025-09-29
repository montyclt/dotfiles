#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# User-level configs
stow -d "$DOTFILES" -t "$HOME/.config/git" git
stow -d "$DOTFILES" -t "$HOME/.config/hypr" hypr
stow -d "$DOTFILES" -t "$HOME/.config/omarchy" omarchy
stow -d "$DOTFILES" -t "$HOME/.config/uwsm" uwsm
stow -d "$DOTFILES" -t "$HOME/.config/walker" walker

# System-level config (needs sudo)
sudo stow -d "$DOTFILES" -t /etc/keyd keyd
