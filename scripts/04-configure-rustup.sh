#!/bin/bash

set -e
source "$1/scripts/00-common.sh"
log_step "Setting rustup default toolchain to stable"

rustup default stable

log_info "rustup configured"
