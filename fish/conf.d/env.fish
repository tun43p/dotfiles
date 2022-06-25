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

set -gx DART /usr/lib/dart
set -gx FLUTTER $LOCAL/lib/flutter
set -gx GOPATH $HOME/.go
set -gx GOBIN $GOPATH/bin

set -gx ANDROID_SDK_ROOT $LOCAL/lib/android/sdk

set -U fish_user_paths \
    $LOCAL/bin \
    $DOTFILES/scripts \
    $DART/bin \
    $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $ANDROID_SDK_ROOT/platform-tools \
    $FLUTTER/bin \
    $GOBIN
