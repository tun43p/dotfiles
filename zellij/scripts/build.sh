#!/usr/bin/env bash
set -euo pipefail

ZELLIJ_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT="$ZELLIJ_DIR/config.kdl"

PLUGINS=(
    "https://github.com/karimould/zellij-forgot/releases/download/0.4.2/zellij_forgot.wasm"
    "https://github.com/hiasr/vim-zellij-navigator/releases/download/0.3.0/vim-zellij-navigator.wasm"
)

if [ ! -d "$ZELLIJ_DIR/plugins" ]; then
    mkdir -p "$ZELLIJ_DIR/plugins"
fi

for plugin in "${PLUGINS[@]}"; do
    echo "Downloading $plugin"
    curl -L "$plugin" -o "$ZELLIJ_DIR/plugins/$(basename "$plugin")"
done

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
