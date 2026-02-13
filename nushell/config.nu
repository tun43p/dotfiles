# config.nu — Main configuration file
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# Hide banner
$env.config.show_banner = false

# Set rm to always trash
$env.config.rm.always_trash = true

# Set edition parameters
$env.config.buffer_editor = $env.VISUAL
$env.config.edit_mode = "vi"
$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"

# Set history parameters
$env.config.history.file_format = "sqlite"
$env.config.history.max_size = 100_000

# Set completions parameters
$env.config.completions.algorithm = "fuzzy"
$env.config.completions.case_sensitive = false

# Set table parameters
$env.config.highlight_resolved_externals = true
$env.config.table.mode = "rounded"
$env.config.table.header_on_separator = false
$env.config.error_style = "fancy"
$env.config.recursion_limit = 50

# AZERTY pipe fix — Alt+Shift+L and Alt+L
$env.config.keybindings = [
    {
        name: insert_pipe
        modifier: shift_alt
        keycode: char_l
        mode: [vi_insert vi_normal]
        event: { edit: insertchar, value: "|" }
    }
    {
        name: insert_pipe_alt
        modifier: alt
        keycode: char_l
        mode: [vi_insert vi_normal]
        event: { edit: insertchar, value: "|" }
    }
]

# Override nu open command with macOS open command
alias nu-open = open
alias open = ^open

# Reload nushell config
alias reload = ^source "/Library/Application Support/nushell/config.nu"

# ls — nushell `ls` returns structured tables, these are for unix habits
alias lsc = ^ls --color=always
alias ll = ^ls -l --color=always
alias la = ^ls -lA --color=always

# Load vendor modules
source vendor/mod.nu