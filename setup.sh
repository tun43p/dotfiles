#!/usr/bin/env zsh

DOTFILES="$HOME/Code/github.com/tun43p/dotfiles"

typeset -A links=(
    "$HOME/.claude" "claude"
    "$HOME/.config/ghostty" "ghostty"
    "$HOME/.gitconfig" "git/gitconfig"
    "$HOME/.config/matcha" "matcha"
    "$HOME/.config/nvim" "nvim"
    "$HOME/.config/opencode" "opencode"
    "$HOME/Library/Application Support/lazygit" "lazygit"
    "$HOME/Library/Application Support/Code/User/settings.json" "vscode/settings.json"
    "$HOME/.config/zellij" "zellij"
    "$HOME/.tmux.conf" "tmux/tmux.conf"
    "$HOME/.zshrc" "zsh/zshrc"
    "$HOME/.zshenv" "zsh/zshenv"
)

for target src in ${(kv)links}; do
    echo "Linking $target -> $src..."
    rm -rf -- "$target" && ln -sf "$DOTFILES/$src" "$target"
done

echo "Done!"
