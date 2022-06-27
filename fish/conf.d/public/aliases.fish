#!/usr/bin/fish

alias reload "source $HOME/.config/fish/config.fish"

alias code codium

alias dots "cd $DOTFILES"
alias repos "cd $REPOSITORIES"

alias up="sudo killall snap-store && sudo apt-get update && sudo apt-get full-upgrade && sudo snap refresh"
