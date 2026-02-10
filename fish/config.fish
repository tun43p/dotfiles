if status is-interactive
    # Disable fish greeting
    set -g fish_greeting

    # Set the default prompt
    set -gx GPG_TTY $(tty)

    # Set some default application variables
    set -gx EDITOR nvim
    set -gx VISUAL windsurf 
    set -gx BROWSER /Applications/Sarafi.app/Contents/MacOS/Safari
    set -gx CHROME_EXECUTABLE "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

    # Set Homebrew path 
    set -gx HOMEBREW /opt/homebrew
    set -gx ICU4C $HOMEBREW/opt/icu4c@76

    # Set Java path 
    set -gx OPENJDK_DIR $HOMEBREW/opt/openjdk@17
    set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home

    # Set Android SDK path 
    set -gx ANDROID_HOME $HOME/Library/Android/sdk
    set -gx ANDROID_SDK_ROOT $ANDROID_HOME

    # Set cache path for Dart and Flutter dependencies 
    set -gx PUB_CACHE $HOME/.pub-cache

    # Set PyEnv path for Python
    set -gx PYENV_ROOT $HOME/.pyenv
    set -gx PYTHON_CONFIGURE_OPTS "--enable-shared --with-openssl=$(brew --prefix openssl)"

    # Set Cargo path for Rust 
    set -gx CARGO_DIR $HOME/.cargo

    # Set Go path 
    set -gx GOPATH $HOME/.go

    # Set Gems path for Ruby 
    set -gx GEMS_PATH $HOME/.gem/ruby/2.6.0

    # Set Solana release path
    set -gx SOLANA_ACTIVE_RELEASE /Users/tun43p/.local/share/solana/install/active_release

    # Set PICO-8 application and data paths 
    set -gx PICO8_APP_DIR /Applications/PICO-8/PICO-8.app/Contents/MacOS
    set -gx PICO8_DAT_DIR "$HOME/Library/Application Support/pico-8"

    # Set GNU Tar directory
    set -gx GNU_TAR /opt/homebrew/opt/gnu-tar/libexec/

    # Set default directories
    set -gx DESKTOP $HOME/Desktop
    set -gx DOCUMENTS $HOME/Documents
    set -gx DOWNLOADS $HOME/Downloads
    set -gx MOVIES $HOME/Movies
    set -gx MUSIC $HOME/Music
    set -gx PICTURES $HOME/Pictures
    set -gx PUBLIC $HOME/Public
    set -gx LOCAL $HOME/.local

    # Set custom directories
    set -gx CODE $DOCUMENTS/Code
    set -gx DOTFILES $CODE/github.com/tun43p/dotfiles

    # Configure flags 
    set -gx LDFLAGS "-L/opt/local/lib -L$HOMEBREW/opt/zlib/lib -L$HOMEBREW/opt/readline/lib -L$HOMEBREW/opt/openssl/lib -L$ICU4C/lib"
    set -gx CPPFLAGS "-I/opt/local/include -I$HOMEBREW/opt/zlib/include -I$HOMEBREW/opt/readline/include -I$HOMEBREW/opt/openssl/include -I$OPENJDK_DIR/include -I$ICU4C/include"
    set -gx PKG_CONFIG_PATH "$HOMEBREW/opt/zlib/lib/pkgconfig:$HOMEBREW/opt/openssl/lib/pkgconfig:$ICU4C/lib/pkgconfig"

    # Set environment variables
    fish_add_path \
        $LOCAL/bin \
        $DOTFILES/bin \
        $HOMEBREW/bin \
        $HOMEBREW/sbin \
        $ICU4C/bin \
        $ICU4C/sbin \
        $GNU_TAR/gnubin \
        $OPENJDK_DIR/bin \
        $ANDROID_SDK/cmdline-tools/latest/bin \
        $ANDROID_SDK/platform-tools \
        $PUB_CACHE/bin \
        $PYENV_ROOT/bin \
        $CARGO_DIR/bin \
        $GOPATH/bin \
        $GEMS_PATH/bin \
        $SOLANA_ACTIVE_RELEASE/bin \

    # Add Windsurf path
    fish_add_path /Users/tun43p/.codeium/windsurf/bin

    # Reload the shell
    alias reload "source $HOME/.config/fish/config.fish"
    
    # Terraform alias
    alias tf "terraform"

    # Launch pinentry-mac as the default GPG agent
    alias pinentry pinentry-mac

    # Get rid of default Vim
    alias vim nvim

    # Set default color for ls command
    alias ls "ls --color=always"
    alias ll "ls -l --color=always"
    alias la "ls -lA --color=always"
    alias l "ls -CF --color=always"

    # Edit configuration files
    alias dots "nvim $DOTFILES"

    # Refresh GPG agent
    alias refresh_gpg "gpgconf --kill gpg-agent; gpg-agent --daemon"

    # Set up fzf key bindings
    fzf --fish | source

    # Initialize PyEnv
    status --is-interactive; and . (pyenv init -|psub)
    status --is-interactive; and pyenv virtualenv-init - | source

    # Set global Node version
    set --universal nvm_default_version latest 

    # Add bun to PATH
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH $BUN_INSTALL/bin $PATH

    # Source Google Cloud SDK
    source /opt/homebrew/share/google-cloud-sdk/path.fish.inc

    # Source private configuration file
    source $HOME/.config/fish/config.private.fish
end

