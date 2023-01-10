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

    set -gx LV2_PATH $HOME/.lv2

    set -gx CARGO_HOME $HOME/.cargo
    set -gx GOROOT /usr/local/go
    set -gx GOPATH $HOME/.go
    set -gx GOBIN $GOPATH/bin
    set -gx DENO_HOME $HOME/.deno
    set -gx PYENV_ROOT $HOME/.pyenv
    set -gx FLUTTER_HOME $HOME/.flutter
    set -gx ANDROID_SDK_HOME $HOME/android/sdk
    set -gx ANDROID_SDK_BIN $ANDROID_SDK_HOME/cmdline-tools/latest/bin $ANDROID_SDK_HOME/platform-tools

    set -U fish_user_paths\
    $HOME/.local/bin \
        $CARGO_HOME/bin \
        $GOROOT/bin \
        $GOBIN \
        $DENO_HOME/bin \
        $PYENV_ROOT/bin \
        $ANDROID_SDK_BIN \
        $FLUTTER_HOME/bin \
        $fish_user_paths

    function apti
        sudo apt-get update && sudo apt-get install $argv
    end

    function aptu
        sudo apt-get update && sudo apt-get full-upgrade
    end

    function aptr
        sudo apt-get autoremove --purge $argv
    end

    alias rel="source $XDG_CONFIG_DIR/fish/config.fish"

    # Override Dart Flutter version
    alias dart="/usr/bin/dart"

    alias repos="cd $REPOS"
    alias dots="cd $DOTS"

    alias mi="micro"

    pyenv init - | source

    # Set terminal colors
    sh $DOTS/scripts/set_colors.sh
end
