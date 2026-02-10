#!/bin/sh

DOTS_DIR="$(cd "$(dirname "$0")" && pwd)"

setup_symlink() {
    target="$1"
    source="$2"

    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        rm -rf "$target"
    fi

    ln -s "$source" "$target"
    echo "Linked $target -> $source"
}

echo "Creating symlinks..."

echo "Creating config directory if it doesn't exist..."
mkdir -p "$HOME/.config"

setup_symlink "$HOME/.config/aerospace" "$DOTS_DIR/aerospace"
setup_symlink "$HOME/.config/fish"      "$DOTS_DIR/fish"
setup_symlink "$HOME/.gitconfig"        "$DOTS_DIR/git/gitconfig"
setup_symlink "$HOME/.config/nvim"      "$DOTS_DIR/nvim"
setup_symlink "$HOME/.tmux.conf"        "$DOTS_DIR/tmux/tmux.conf"
setup_symlink "$HOME/.config/skhd"      "$DOTS_DIR/skhd"

echo "Done."
