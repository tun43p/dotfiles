if status is-interactive
    set -g fish_greeting

    set -gx GPG_TTY $(tty)

    set -gx EDITOR nvim
    set -gx VISUAL code
    set -gx BROWSER /Applications/Arc.app/Contents/MacOS/Arc
    set -gx CHROME_EXECUTABLE "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

    set -gx HOMEBREW /opt/homebrew

    set -gx ANDROID_SDK $HOME/Library/Android/sdk
    set -gx ANDROID_HOME $ANDROID_SDK

    set -gx PUB_CACHE $HOME/.pub-cache

    set -gx CARGO_DIR $HOME/.cargo

    set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home
    set -gx OPENJDK_DIR $HOMEBREW/opt/openjdk

    set -gx GEMS_PATH $HOME/.gem/ruby/2.6.0

    set -gx GHCUP $HOME/.ghcup

    set -gx CPPFLAGS "-I/$OPENJDK_DIR/include"

    # How to add this to ?
    # set -gx LDFLAGS "-L/opt/homebrew/opt/zlib/lib"
    # set -gx CPPFLAGS "-I/opt/homebrew/opt/zlib/include"
    # set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/zlib/lib/pkgconfig"

    set -gx SUPERCOLLIDER /Applications/SuperCollider.app/Contents/MacOS

    set -gx PICO8_APP_DIR /Applications/PICO-8/PICO-8.app/Contents/MacOS
    set -gx PICO8_DAT_DIR "$HOME/Library/Application Support/pico-8"

    set -gx DESKTOP $HOME/Desktop
    set -gx DOCUMENTS $HOME/Documents
    set -gx DOWNLOADS $HOME/Downloads
    set -gx LIBRARY $HOME/Library
    set -gx MOVIES $HOME/Movies
    set -gx MUSIC $HOME/Music
    set -gx PICTURES $HOME/Pictures
    set -gx PUBLIC $HOME/Public

    set -gx CODE $DOCUMENTS/Code
    set -gx DOTFILES $CODE/github.com/tun43p/dotfiles

    fish_add_path \
        $HOMEBREW/bin \
        $HOMEBREW/sbin \
        $ANDROID_SDK/cmdline-tools/latest \
        $ANDROID_SDK/platform-tools \
        $PUB_CACHE/bin \
        $CARGO_DIR/bin \
        $GHCUP/bin \
        $OPENJDK_DIR/bin \
        $GEMS_PATH/bin \
        $SQLITE_DIR/bin \
        $SUPERCOLLIDER

    alias reload "source $HOME/.config/fish/config.fish"
    alias pinentry pinentry-mac

    alias vim nvim
end
