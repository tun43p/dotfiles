# Zellij Config Split — Design Spec

## Goal

Split the monolithic `zellij/config.kdl` (~700 lines) into focused sub-files and generate the final `config.kdl` via a `build.sh` script.

## Context

- Zellij does not support native `include` directives in `config.kdl`
- The current file mixes options, plugin aliases, keybindings (all modes), and shared blocks
- A `keybinds/` directory already exists (was deleted then re-created)
- `zellij/plugins/` is already gitignored
- `scripts/download_plugins.sh` already exists

## Architecture

`build.sh` concatenates partial `.kdl` files in a specific order to produce a valid `config.kdl`. The `keybinds` block requires wrapping (`keybinds clear-defaults=true { ... }`), so the script handles the open/close braces explicitly. All other `core/` files are top-level KDL nodes and can be concatenated directly.

Generated `config.kdl` is gitignored — it is a build artifact.

## File Structure

```
zellij/
  build.sh                  # composition script
  config.kdl                # GENERATED, gitignored
  core/
    00-options.kdl          # theme, default_layout, show_startup_tips, support_kitty_keyboard_protocol, etc.
    01-plugins.kdl          # plugins { ... } block (aliases)
    02-load-plugins.kdl     # load_plugins { ... } block
    03-web-client.kdl       # web_client { ... } block
  keybinds/
    00-locked.kdl           # locked mode
    01-pane.kdl             # pane mode + renamepane
    02-tab.kdl              # tab mode + renametab
    03-resize.kdl           # resize mode
    04-move.kdl             # move mode
    05-scroll.kdl           # scroll mode + entersearch
    06-search.kdl           # search mode
    07-session.kdl          # session mode
    08-shared.kdl           # shared_except / shared_among blocks
    99-plugins.kdl          # vim-zellij-navigator + zellij_forgot bindings
  plugins/                  # .wasm files (already gitignored)
  scripts/
    download_plugins.sh
```

## build.sh Behavior

1. Write `keybinds clear-defaults=true {` to `config.kdl`
2. Concatenate each `keybinds/*.kdl` file (sorted by name) with a blank line separator
3. Write `}` to close the `keybinds` block
4. Concatenate each `core/*.kdl` file (sorted by name) with a blank line separator
5. Print success message with output path

The script is idempotent — re-running it overwrites `config.kdl`.

## .gitignore

Add `zellij/config.kdl` to the root `.gitignore`.

## Out of Scope

- Hot-reloading / file watching
- Validation of generated KDL
- Any changes to `scripts/download_plugins.sh`
