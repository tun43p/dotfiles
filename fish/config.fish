if status is-interactive
    # Disable fish greeting
    set -g fish_greeting

    # Set the default prompt
    set -gx GPG_TTY $(tty)

    # Set some default application variables
    set -gx EDITOR nvim
    set -gx VISUAL code
    set -gx BROWSER /Applications/Sarafi.app/Contents/MacOS/Safari
    set -gx CHROME_EXECUTABLE "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

    # Set Homebrew path 
    set -gx HOMEBREW /opt/homebrew

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

    # Set GHCUP path for Haskell 
    set -gx GHCUP $HOME/.ghcup

    # Set SupperCollider application path 
    set -gx SUPERCOLLIDER /Applications/SuperCollider.app/Contents/MacOS

    # Set PICO-8 application and data paths 
    set -gx PICO8_APP_DIR /Applications/PICO-8/PICO-8.app/Contents/MacOS
    set -gx PICO8_DAT_DIR "$HOME/Library/Application Support/pico-8"

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
    set -gx LDFLAGS "-L/opt/local/lib -L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/readline/lib -L/opt/homebrew/opt/openssl/lib"
    set -gx CPPFLAGS "-I/opt/local/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/readline/include -I/opt/homebrew/opt/openssl/include -I/$OPENJDK_DIR/include"
    set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/zlib/lib/pkgconfig:/opt/homebrew/opt/openssl/lib/pkgconfig"

    # Set environment variables
    fish_add_path \
        $LOCAL/bin \
        $HOMEBREW/bin \
        $HOMEBREW/sbin \
        $OPENJDK_DIR/bin \
        $ANDROID_SDK/cmdline-tools/latest/bin \
        $ANDROID_SDK/platform-tools \
        $PUB_CACHE/bin \
        $PYENV_ROOT/bin \
        $CARGO_DIR/bin \
        $GOPATH/bin \
        $GEMS_PATH/bin \
        $GHCUP/bin \
        $SUPERCOLLIDER

    # Reload the shell
    alias reload "source $HOME/.config/fish/config.fish"

    # Launch pinentry-mac as the default GPG agent
    alias pinentry pinentry-mac

    # Get rid of default Vim
    alias vim nvim

    alias ls "ls --color=always"
    alias ll "ls -l --color=always"
    alias la "ls -lA --color=always"
    alias l "ls -CF --color=always"

    # Create some aliases for Git
    alias ga "git add"
    alias gc "git commit -m"
    alias gp "git pull $1"
    alias gpo "git pull origin $1"
    alias gch "git pull; git checkout $1"
    alias gchb "git pull; git checkout -b $1"

    # Create some aliases for Docker
    alias dc "docker compose"
    alias dcu "docker compose up"
    alias dcub "docker compose up --build"
    alias dcd "docker compose down"
    alias dcdv "docker compose down -v"

    # Use the latest Node.js version
    nvm use latest

    # Initialize PyEnv
    pyenv init - | source
    pyenv virtualenv-init - | source

    # Source private configuration file
    source $HOME/.config/fish/config.private.fish
end
