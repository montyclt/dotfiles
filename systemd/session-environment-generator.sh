#!/bin/bash

set -euo pipefail

COMMON_DIR="$HOME/.config/environment/common"
SESSION_DIR="$HOME/.config/environment/session"

process_dir() {
    local dir="$1"

    [[ -d "$dir" ]] || return 0

    for file in "$dir"/*.conf; do
        [[ -f "$file" ]] || continue
        
        while IFS='=' read -r key value || [[ -n "$key" ]]; do
            # Skip empty lines and comments
            [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
            
            # Expand variables in the value
            expanded_value=$(eval echo "$value")
            
            # Output the variable
            echo "${key}=${expanded_value}"
        done < "$file"
    done
}

process_dir "$COMMON_DIR"
process_dir "$SESSION_DIR"

exit 0