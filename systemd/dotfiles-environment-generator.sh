#!/bin/bash

set -euo pipefail

COMMON_DIR="$HOME/.config/environment/common"
SESSION_DIR="$HOME/.config/environment/session"

process_dir() {
    local dir="$1"

    [[ -d "$dir" ]] || return 0

    for file in "$dir"/*; do
        [[ -f "$file" ]] && cat "$file"
    done
}

process_dir "$COMMON_DIR"
process_dir "$SESSION_DIR"

exit 0