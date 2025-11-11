#!/bin/bash
set -e

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$CURRENT_DIR/scripts"

source "$SCRIPTS_DIR/00-common.sh"

# Verify script is not running as root
if [[ $EUID -eq 0 ]]; then
    log_error "This script must NOT be run as root"
    exit 1
fi

log_step "Starting Arch Linux configuration"

# Execute scripts in order
scripts=(
    "01-install-packages.sh"
    "02-install-aur.sh"
    "03-configure-limine.sh"
    "05-configure-autologin.sh"
    "06-configure-keyring.sh"
    "07-install-xwaykeyz.sh"
    "09-setup-dotfiles.sh"
    "10-create-rofi-menu.sh"
)

for script in "${scripts[@]}"; do
    script_path="$SCRIPTS_DIR/$script"

    if [[ ! -f "$script_path" ]]; then
        log_error "Script not found: $script_path"
        exit 1
    fi

    log_step "Running $script"
    bash "$script_path" "$CURRENT_DIR" || {
        log_error "Error in $script"
        exit 1
    }
done

log_info "Configuration completed successfully!"
log_info "Please restart your session or run: exec dbus-run-session sway"
