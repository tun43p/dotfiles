# env.nu — Environment variables
#
# Installed by:
# version = "0.110.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

use std 'path add'

# GPG
$env.GPG_TTY = (^tty)

# Default directories
$env.DESKTOP = ($env.HOME | path join "Desktop")
$env.DOCUMENTS = ($env.HOME | path join "Documents")
$env.DOWNLOADS = ($env.HOME | path join "Downloads")
$env.MOVIES = ($env.HOME | path join "Movies")
$env.MUSIC = ($env.HOME | path join "Music")
$env.PICTURES = ($env.HOME | path join "Pictures")
$env.PUBLIC = ($env.HOME | path join "Public")

# Custom directories
$env.CODE = ($env.DOCUMENTS | path join "Code")
$env.DOTS = ($env.CODE | path join "github.com" "tun43p" "dotfiles")

# Editors
$env.EDITOR = "nvim"
$env.VISUAL = "windsurf"

# Browser
$env.BROWSER = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
$env.CHROME_EXECUTABLE = $env.BROWSER

# Homebrew
$env.HOMEBREW = "/opt/homebrew"

# Python
$env.PYENV_ROOT = ($env.HOME | path join ".pyenv")
$env.PYTHON_CONFIGURE_OPTS = "--enable-shared --with-openssl=/opt/homebrew/opt/openssl"
$env.CLOUDSDK_PYTHON = ($env.PYENV_ROOT | path join "shims" "python")

# Rust
$env.CARGO_DIR = ($env.HOME | path join ".cargo")

# Go
$env.GOPATH = ($env.HOME | path join ".go")

# Bun
$env.BUN_INSTALL = ($env.HOME | path join ".bun")

# Dart / Flutter
$env.PUB_CACHE = ($env.HOME | path join ".pub-cache")

# Java
$env.OPENJDK_DIR = ($env.HOMEBREW | path join "opt" "openjdk@17")
$env.JAVA_HOME = "/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"

# Android
$env.ANDROID_HOME = ($env.HOME | path join "Library" "Android" "sdk")
$env.ANDROID_SDK_ROOT = $env.ANDROID_HOME

# Ruby
$env.GEMS_PATH = ($env.HOME | path join ".gem" "ruby" "2.6.0")

# Solana
$env.SOLANA_ACTIVE_RELEASE = ($env.HOME | path join ".local" "share" "solana" "install" "active_release")

# PICO-8
$env.PICO8_APP_DIR = "/Applications/PICO-8/PICO-8.app/Contents/MacOS"
$env.PICO8_DAT_DIR = ($env.HOME | path join "Library" "Application Support" "pico-8")

# GNU Tar
$env.GNU_TAR = ($env.HOMEBREW | path join "opt" "gnu-tar" "libexec")

# Library paths (compilation)
$env.ICU4C = ($env.HOMEBREW | path join "opt" "icu4c@76")
$env.LDFLAGS = $"-L/opt/local/lib -L($env.HOMEBREW)/opt/zlib/lib -L($env.HOMEBREW)/opt/readline/lib -L($env.HOMEBREW)/opt/openssl/lib -L($env.ICU4C)/lib"
$env.CPPFLAGS = $"-I/opt/local/include -I($env.HOMEBREW)/opt/zlib/include -I($env.HOMEBREW)/opt/readline/include -I($env.HOMEBREW)/opt/openssl/include -I($env.OPENJDK_DIR)/include -I($env.ICU4C)/include"
$env.PKG_CONFIG_PATH = $"($env.HOMEBREW)/opt/zlib/lib/pkgconfig:($env.HOMEBREW)/opt/openssl/lib/pkgconfig:($env.ICU4C)/lib/pkgconfig"

# Global path
$env.PATH = (
    $env.PATH
    | split row (char esep)
    | prepend [
        # System
        "/usr/local/bin"
    
        # User local
        ($env.HOME | path join ".local" "bin")
        ($env.DOTS | path join "bin")
        ($env.DOTS | path join "local" "bin")

        # Homebrew
        ($env.HOMEBREW | path join "bin")
        ($env.HOMEBREW | path join "sbin")

        # System overrides
        ($env.GNU_TAR | path join "gnubin")
        ($env.ICU4C | path join "bin")
        ($env.ICU4C | path join "sbin")

        # Language / Package managers
        ($env.PYENV_ROOT | path join "bin")
        ($env.PYENV_ROOT | path join "shims")
        ($env.CARGO_DIR | path join "bin")
        ($env.GOPATH | path join "bin")
        ($env.BUN_INSTALL | path join "bin")
        ($env.PUB_CACHE | path join "bin")
        ($env.GEMS_PATH | path join "bin")

        # SDKs / Platform tools
        ($env.OPENJDK_DIR | path join "bin")
        ($env.ANDROID_HOME | path join "cmdline-tools" "latest" "bin")
        ($env.ANDROID_HOME | path join "platform-tools")
        ($env.HOMEBREW | path join "share" "google-cloud-sdk" "bin")

        # Specialized tools
        ($env.SOLANA_ACTIVE_RELEASE | path join "bin")

        # IDE / Editors
        ($env.HOME | path join ".codeium" "windsurf" "bin")
    ]
    | uniq
)

# Source private environment variables
source env.private.nu