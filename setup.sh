#!/usr/bin/env zsh

DOTFILES="$HOME/Documents/Forge/src/github.com/tun43p/dotfiles"

typeset -A links=(
    "$HOME/.claude" "claude"
    "$HOME/.claude.json" "claude.json"
    "$HOME/.gitconfig" "git/gitconfig"
    "$HOME/.hammerspoon" "hammerspoon"
    "$HOME/Library/Application Support/himalaya" "himalaya"
    "$HOME/.config/kitty" "kitty"
    "$HOME/Library/Application Support/lazygit" "lazygit"
    "$HOME/.config/nvim" "nvim"
    "$HOME/.config/opencode" "opencode"
    "$HOME/.tmux.conf" "tmux/tmux.conf"
    "$HOME/Library/Application Support/Code/User/settings.json" "vscode/settings.json"
    "$HOME/.zshrc" "zsh/zshrc"
    "$HOME/.zshenv" "zsh/zshenv"
)

for target src in ${(kv)links}; do
    echo "Linking $target -> $src..."
    rm -rf -- "$target" && ln -sf "$DOTFILES/$src" "$target"
done

echo "Done!"
