#!/usr/bin/fish

if status is-interactive
    for f in $HOME/.config/fish/config/private/*
        source $f
    end

    for f in $HOME/.config/fish/config/public/*
        source $f
    end

    for f in $HOME/.config/fish/scripts/private/*
        source $f
    end

    for f in $HOME/.config/fish/scripts/public/*
        source $f
    end
end
