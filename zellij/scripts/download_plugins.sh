
PLUGINS=(
    "https://github.com/karimould/zellij-forgot/releases/download/0.4.2/zellij_forgot.wasm"
    "https://github.com/hiasr/vim-zellij-navigator/releases/download/0.3.0/vim-zellij-navigator.wasm"
)

for plugin in "${PLUGINS[@]}"; do
    echo "Downloading $plugin"
    curl -L "$plugin" -o "$HOME/.config/zellij/plugins/$(basename "$plugin")"
done