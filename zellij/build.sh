#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="$SCRIPT_DIR/config.kdl"

{
    echo "keybinds clear-defaults=true {"
    echo ""
    for f in "$SCRIPT_DIR"/keybinds/*.kdl; do
        cat "$f"
        echo ""
    done
    echo "}"
    echo ""
    for f in "$SCRIPT_DIR"/core/*.kdl; do
        cat "$f"
        echo ""
    done
} > "$OUTPUT"

echo "Built $OUTPUT"
