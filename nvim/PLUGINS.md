# Plugins

Plugins are loaded via `lua/pack.lua` using the native `vim.pack` API (Neovim 0.12+).
Each plugin lives in `lua/plugins/<name>.lua` and exposes a `spec` and optional
`config`.

---

## Dependencies (`_deps`)

Shared libraries required by other plugins.

| Plugin                                                              | Purpose                                                       |
| ------------------------------------------------------------------- | ------------------------------------------------------------- |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)            | Lua utility library (async, files, etc.) used by many plugins |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File type icons used across the UI                            |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim)                 | UI component library used by noice                            |

---

## Colorscheme

| Plugin                                                   | Purpose                                                  |
| -------------------------------------------------------- | -------------------------------------------------------- |
| [vesper.nvim](https://github.com/datsfilipe/vesper.nvim) | Dark colorscheme with transparent background and italics |

---

## UI

| Plugin                                                          | Purpose                                                                 |
| --------------------------------------------------------------- | ----------------------------------------------------------------------- |
| [which-key.nvim](https://github.com/folke/which-key.nvim)       | Displays available keybindings in a popup after a short delay           |
| [noice.nvim](https://github.com/folke/noice.nvim)               | Replaces the cmdline, messages, and popupmenu with a modern floating UI |
| [nvim-notify](https://github.com/rcarriga/nvim-notify)          | Animated notification popups, used as the backend for noice             |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)   | Tab-like buffer list at the top of the screen with LSP diagnostics      |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)    | Status line showing mode, branch, diagnostics, filename, LSP clients    |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer sidebar with filesystem, buffers, and git status views    |

---

## Navigation

| Plugin                                                                                   | Purpose                                                           |
| ---------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)                       | Fuzzy finder for files, grep, buffers, LSP symbols, keymaps, etc. |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | Native C fzf sorter for telescope, improves performance           |
| [flash.nvim](https://github.com/folke/flash.nvim)                                        | Jump anywhere in the buffer using labeled character targets       |

---

## Editing

| Plugin                                                              | Purpose                                                        |
| ------------------------------------------------------------------- | -------------------------------------------------------------- |
| [mini.pairs](https://github.com/echasnovski/mini.pairs)             | Auto-closes brackets, quotes, and braces in insert mode        |
| [mini.surround](https://github.com/echasnovski/mini.surround)       | Add, delete, replace surrounding characters (`sa`, `sd`, `sr`) |
| [mini.bufremove](https://github.com/echasnovski/mini.bufremove)     | Deletes buffers without closing the window/split               |
| [mini.indentscope](https://github.com/echasnovski/mini.indentscope) | Visual indicator for the current indentation scope             |
| [mini.cursorword](https://github.com/echasnovski/mini.cursorword)   | Highlights all occurrences of the word under the cursor        |

---

## Treesitter

| Plugin                                                                | Purpose                                                                   |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax parsing for highlighting, folding, and treesitter-based navigation |

---

## LSP & Completion

| Plugin                                                                       | Purpose                                                           |
| ---------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                     | LSP/linter/formatter installer and manager                        |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridges mason and nvim-lspconfig for auto-enabling LSP servers    |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                   | Configurations for built-in Neovim LSP client                     |
| [blink.cmp](https://github.com/saghen/blink.cmp)                             | Fast completion engine with LSP, snippets, buffer, and AI sources |
| [blink.lib](https://github.com/saghen/blink.lib)                             | Native Rust library used by blink.cmp for fuzzy matching          |
| [minuet-ai.nvim](https://github.com/milanglacier/minuet-ai.nvim)             | AI completion source for blink.cmp via OpenRouter                 |

---

## Formatting & Linting

| Plugin                                                                                    | Purpose                                                                       |
| ----------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                                  | Formats files on save using per-filetype formatters (prettierd, stylua, etc.) |
| [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) | Ensures formatters and linters are installed via mason on startup             |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)                                    | Runs linters asynchronously on buffer events (eslint_d, ruff, etc.)           |

---

## Git

| Plugin                                                      | Purpose                                                               |
| ----------------------------------------------------------- | --------------------------------------------------------------------- |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git hunk signs in the gutter, inline blame, and hunk actions          |
| [gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim)   | Generates and opens a browser link to the current file/line on GitHub |

---

## Diagnostics

| Plugin                                                            | Purpose                                                                 |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------- |
| [trouble.nvim](https://github.com/folke/trouble.nvim)             | Structured panel for diagnostics, LSP references, quickfix, and loclist |
| [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlights and navigates `TODO`, `FIXME`, `NOTE`, etc. comments         |

---

## Terminal

| Plugin                                                        | Purpose                                                          |
| ------------------------------------------------------------- | ---------------------------------------------------------------- |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Toggleable floating or split terminal, also used to open lazygit |

---

## Markdown & Images

| Plugin                                                                               | Purpose                                                                   |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Renders markdown with styled headings, code blocks, and bullets in-buffer |
| [image.nvim](https://github.com/3rd/image.nvim)                                      | Displays images inline in the terminal via the Kitty graphics protocol    |

---

## AI

| Plugin                                                     | Purpose                                             |
| ---------------------------------------------------------- | --------------------------------------------------- |
| [opencode.nvim](https://github.com/sudo-tee/opencode.nvim) | Neovim integration for the opencode AI coding agent |
