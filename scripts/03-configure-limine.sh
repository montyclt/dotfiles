#!/bin/bash
set -euo pipefail

CURRENT_DIR="$1"
SCRIPTS_DIR="$CURRENT_DIR/scripts"
source "$SCRIPTS_DIR/00-common.sh"

log_step "Configuring Limine for Arch netboot"

# Install EFI binary
ESP_ARCH_DIR="/boot/EFI/arch"
DEST_EFI="$ESP_ARCH_DIR/ipfx-arch.efi"
sudo mkdir -p "$ESP_ARCH_DIR"
SOURCE_EFI="$CURRENT_DIR/boot/ipxe-arch.efi"
log_info "Installing EFI binary to $DEST_EFI"
sudo install -m 0644 "$SOURCE_EFI" "$DEST_EFI"

# Write Limine configuration (simple, no idempotency/defensive checks)
LIMINE_DIR="/boot/EFI/limine"
LIMINE_CONF="$LIMINE_DIR/limine.conf"
sudo mkdir -p "$LIMINE_DIR"

# 1) Ensure first line is exactly TIMEOUT=no
sudo sed -i '1s/.*/timeout: no/' "$LIMINE_CONF"

# 2) Remove any existing fallback entry stanza (case-insensitive)
#    Removes from a header line containing "fallback" until the next header (line starting with ":") or EOF
sudo awk -v IGNORECASE=1 '
  BEGIN{skip=0}
  /^\/.*fallback/ {skip=1; next}
  /^\/[^\/]/ { if (skip) { skip=0 } }
  { if (!skip) print }
' "$LIMINE_CONF" > "$LIMINE_CONF.tmp"
sudo mv "$LIMINE_CONF.tmp" "$LIMINE_CONF"

# 3) Append the netboot entry at the end
sudo bash -c "cat >> '$LIMINE_CONF' <<'EOF'

/Arch Linux (netboot)
    protocol: efi
    path: boot():/EFI/arch/ipfx-arch.efi
EOF"

log_info "Limine configuration updated at $LIMINE_CONF"
log_info "Done."