#!/usr/bin/env bash
set -euo pipefail

ZELLIJ_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT="$ZELLIJ_DIR/config.kdl"

{
    echo "keybinds clear-defaults=true {"
    echo ""
    for f in "$ZELLIJ_DIR"/keybinds/*.kdl; do
        sed 's/^/    /' "$f"
        echo ""
    done
    echo "}"
    echo ""
    for f in "$ZELLIJ_DIR"/core/*.kdl; do
        cat "$f"
        echo ""
    done
} > "$OUTPUT"

echo "Built $OUTPUT"
