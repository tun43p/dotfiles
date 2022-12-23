if status is-interactive
    set -gx EDITOR micro
    set -gx VISUAL code
    set -gx BROWSER firefox
    set -gx CHROME_EXECUTABLE chromium

    # Parse user-dirs.dirs file and export variables
    for val in (cat $HOME/.config/user-dirs.dirs)
        set values (string split = $val)
        set -gx $values[1] (string replace -a '"' '' $values[2])
        set -e values
    end

    set -gx REPOS $HOME/documents/repositories
    set -gx DOTS $REPOS/github.com/tun43p/dotfiles

	# set -gx QT_QPA_PLATFORMTHEME qt5ct
	# set -gx GTK2_RC_FILES $HOME/.gtkrc-2.0

	set -gx CARGO_HOME $HOME/.cargo
	
	set -gx GOROOT /usr/local/go
	set -gx GOPATH $HOME/.go
	set -gx GOBIN $GOPATH/bin

    set -gx PYENV_ROOT $HOME/.pyenv

    set -U fish_user_paths \
        $HOME/.local/bin \
        $CARGO_HOME/bin \
        $PYENV_ROOT/bin \
        $fish_user_paths

    alias repos "cd $REPOS"
    alias dots "cd $DOTS"

    # pyenv init - | source
end
