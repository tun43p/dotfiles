if status is-interactive
    for f in $HOME/.config/fish/conf.d/*
        source $f
    end

    for f in $HOME/.config/fish/functions/private/*
        source $f
    end

    for f in $HOME/.config/fish/functions/public/*
        source $f
    end
end
