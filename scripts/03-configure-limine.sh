#!/bin/bash
set -euo pipefail

CURRENT_DIR="$1"
SCRIPTS_DIR="$CURRENT_DIR/scripts"
source "$SCRIPTS_DIR/00-common.sh"

log_step "Configuring Limine"

# Install EFI binary
ESP_ARCH_DIR="/boot/EFI/arch"
DEST_EFI="$ESP_ARCH_DIR/ipxe-arch.efi"
sudo mkdir -p "$ESP_ARCH_DIR"
SOURCE_EFI="$CURRENT_DIR/boot/ipxe-arch.efi"
log_info "Installing EFI binary to $DEST_EFI"
sudo install -m 0644 "$SOURCE_EFI" "$DEST_EFI"

LIMINE_DIR="/boot/EFI/limine"
LIMINE_CONF="$LIMINE_DIR/limine.conf"

# Extract the original /Arch Linux (linux) entry properties
LINUX_ENTRY=$(sudo awk '
  /^\/Arch Linux \(linux\)$/{flag=1; next}
  /^\//{flag=0}
  flag && NF {print}
' "$LIMINE_CONF")

# Rewrite the entire file
sudo bash -c "cat > '$LIMINE_CONF' <<EOF
timeout: no

/Arch Linux
    //Boot
    $LINUX_ENTRY

    //Netboot install
        protocol: efi_chainload
        image_path: boot():/EFI/arch/ipxe-arch.efi

    //Snapshots

/Windows 11
    protocol: efi_chainload
    image_path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
EOF"

log_info "Limine configuration updated"
log_info "Done."
