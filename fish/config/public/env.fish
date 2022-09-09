#!/usr/bin/fish

set -gx SHELL /usr/bin/fish
set -gx TERMINAL gnome-terminal
set -gx EDITOR nvim
set -gx VISUAL codium
set -gx CHROME_EXECUTABLE chromium

set -gx LOCAL $HOME/.local
set -gx REPOSITORIES $HOME/documents/repositories
set -gx DOTFILES $REPOSITORIES/github.com/dotfiles
set -gx TEMPLATES $HOME/templates

set -gx ANDROID_SDK_ROOT $LOCAL/lib/android/sdk
set -gx ANDROID_SDK_BIN $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $ANDROID_SDK_ROOT/platform-tools \

set -gx CARGO $HOME/.cargo
set -gx DART /usr/lib/dart
set -gx DENO_INSTALL $HOME/.deno
set -gx FLUTTER $LOCAL/lib/flutter
set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/.go
set -gx GOBIN $GOPATH/bin
set -gx PYENV_ROOT $HOME/.pyenv

set -U fish_user_paths \
    $LOCAL/bin \
    $ANDROID_SDK_BIN \
    $CARGO/bin \
    $DART/bin \
    $DENO_INSTALL/bin \
    $FLUTTER/bin \
    $GOROOT/bin $GOBIN \
    $PYENV_ROOT/bin

