# Neovim Keymaps

> `<leader>` = `Space` | `<localleader>` = `Space Space`

---

## Core (`keymaps.lua`)

### Files

| Key         | Mode | Action    |
| ----------- | ---- | --------- |
| `<leader>s` | n    | Save file |

### Navigation (wrapped lines)

| Key            | Mode | Action                             |
| -------------- | ---- | ---------------------------------- |
| `j` / `<down>` | n    | Move down (respects wrap)          |
| `k` / `<up>`   | n    | Move up (respects wrap)            |
| `H`            | n    | Move to first symbol on line (`^`) |
| `L`            | n    | Move to last symbol on line (`$`)  |

### Windows / Splits

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `<leader>q`  | n    | Kill window           |
| `<leader>wh` | n    | Open horizontal split |
| `<leader>wv` | n    | Open vertical split   |
| `<C-h>`      | n    | Jump to left split    |
| `<C-j>`      | n    | Jump to bottom split  |
| `<C-k>`      | n    | Jump to upper split   |
| `<C-l>`      | n    | Jump to right split   |

### Buffers

| Key       | Mode | Action          |
| --------- | ---- | --------------- |
| `<tab>`   | n    | Next buffer     |
| `<S-tab>` | n    | Previous buffer |

### Misc

| Key         | Mode | Action                 |
| ----------- | ---- | ---------------------- |
| `<leader>c` | n    | Clear search highlight |
| `<leader>t` | n    | Open terminal (Snacks) |

### Visual

| Key       | Mode | Action                               |
| --------- | ---- | ------------------------------------ |
| `<tab>`   | v    | Indent                               |
| `<S-tab>` | v    | Unindent                             |
| `p`       | v    | Paste (without overwriting register) |

---

## Snacks (`plugins/snacks.lua`)

### Picker — Files

| Key          | Mode | Action                 |
| ------------ | ---- | ---------------------- |
| `<leader>ft` | n | Todo comments |
| `<leader>ff` | n | Find files |
| `<leader>fg` | n    | Live grep              |
| `<leader>fb` | n    | Buffers                |
| `<leader>fh` | n    | Help tags              |
| `<leader>fr` | n    | Recent files           |
| `<leader>fc` | n    | Commands               |
| `<leader>fd` | n    | Diagnostics            |
| `<leader>fs` | n    | LSP symbols            |
| `<leader>fw` | n/x  | Grep word under cursor |

### Explorer

| Key         | Mode | Action        |
| ----------- | ---- | ------------- |
| `<leader>e` | n    | File explorer |

### Git

| Key          | Mode | Action          |
| ------------ | ---- | --------------- |
| `<leader>gg` | n | Lazygit |
| `<leader>gb` | n/v | Open in browser |
| `<leader>gl` | n    | Git log         |
| `<leader>gs` | n    | Git status      |
| `<leader>gd` | n    | Git diff        |

### Buffers (Snacks)

| Key          | Mode | Action               |
| ------------ | ---- | -------------------- |
| `<leader>bd` | n    | Delete buffer        |
| `<leader>ba` | n    | Delete all buffers   |
| `<leader>bo` | n    | Delete other buffers |

### Notifications

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `<leader>nh` | n    | Notification history  |
| `<leader>nd` | n    | Dismiss notifications |

### Misc

| Key         | Mode | Action                                |
| ----------- | ---- | ------------------------------------- |
| `<leader>z` | n    | Zen mode                              |
| `]r`        | n/t  | Next LSP reference (Snacks words)     |
| `[r`        | n/t  | Previous LSP reference (Snacks words) |

### Picker — fenêtre input (mode i/n)

| Key                   | Action                  |
| --------------------- | ----------------------- |
| `<CR>`                | Confirm                 |
| `<C-j>` / `<down>`    | List down               |
| `<C-k>` / `<up>`      | List up                 |
| `<S-CR>`              | Pick window + jump      |
| `<S-up>`              | Select and prev         |
| `<S-down>`            | Select and next         |
| `<Esc>` (n)           | Cancel                  |
| `<C-c>` (i)           | Cancel                  |
| `/`                   | Toggle focus input/list |
| `<C-down>` / `<C-up>` | History forward/back    |
| `<C-w>` (i)           | Delete word             |

### Picker — fenêtre list (mode n)

| Key                   | Action                       |
| --------------------- | ---------------------------- |
| `j` / `k`             | Down / Up                    |
| `gg` / `G`            | Top / Bottom                 |
| `i`                   | Focus input                  |
| `q`                   | Cancel                       |
| `zz` / `zt` / `zb`    | Scroll center/top/bottom     |
| `H` / `J` / `K` / `L` | Layout left/bottom/top/right |
| `?`                   | Toggle help                  |
| `<C-v>`               | Edit vsplit                  |
| `<C-s>`               | Edit split                   |
| `<C-t>`               | Open in tab                  |
| `<C-q>`               | Send to quickfix             |

### Explorer (fenêtre list, mode n)

| Key     | Action               |
| ------- | -------------------- |
| `l`     | Open / confirm       |
| `h`     | Close directory      |
| `<BS>`  | Go up                |
| `a`     | Add file/dir         |
| `d`     | Delete               |
| `r`     | Rename               |
| `c`     | Copy                 |
| `m`     | Move                 |
| `o`     | Open with system app |
| `y`     | Yank path            |
| `p`     | Paste                |
| `u`     | Update               |
| `P`     | Toggle preview       |
| `I`     | Toggle ignored       |
| `H`     | Toggle hidden        |
| `.`     | Focus                |
| `/`     | Grep in dir          |
| `<C-t>` | Change dir (tcd)     |
| `<C-x>` | Terminal             |

---

## LSP (`plugins/nvim-lspconfig.lua`)

### Navigation

| Key  | Mode | Action                |
| ---- | ---- | --------------------- |
| `gd` | n    | Goto definition       |
| `gl` | n    | Show line diagnostics |
| `[d` | n    | Previous diagnostic   |
| `]d` | n    | Next diagnostic       |

### References / Types

| Key          | Mode | Action               |
| ------------ | ---- | -------------------- |
| `<leader>lr` | n    | Goto references      |
| `<leader>li` | n    | Goto implementation  |
| `<leader>lt` | n    | Goto type definition |

### Actions

| Key          | Mode | Action           |
| ------------ | ---- | ---------------- |
| `<leader>pa` | n    | Code action      |
| `<leader>pr` | n    | Rename symbol    |
| `<leader>pf` | n    | Format (async)   |
| `<leader>ps` | n    | Workspace symbol |
| `<leader>pd` | n    | Diagnostics list |

### (Buffer-local, on LspAttach)

| Key     | Mode | Action              |
| ------- | ---- | ------------------- |
| `K`     | n    | Hover documentation |
| `<C-k>` | i    | Signature help      |

---

## Gitsigns (`plugins/gitsigns.lua`)

### Navigation

| Key  | Mode | Action        |
| ---- | ---- | ------------- |
| `]h` | n    | Next hunk     |
| `[h` | n    | Previous hunk |

### Actions

| Key          | Mode | Action       |
| ------------ | ---- | ------------ |
| `<leader>hs` | n/v  | Stage hunk   |
| `<leader>hr` | n/v  | Reset hunk   |
| `<leader>hS` | n    | Stage buffer |
| `<leader>hR` | n    | Reset buffer |
| `<leader>hp` | n    | Preview hunk |
| `<leader>hb` | n    | Blame line   |
| `<leader>hd` | n    | Diff this    |

---

## Trouble (`plugins/trouble.lua`)

| Key          | Mode | Action             |
| ------------ | ---- | ------------------ |
| `<leader>xx` | n    | Diagnostics        |
| `<leader>xX` | n    | Buffer diagnostics |
| `<leader>xs` | n    | Symbols            |
| `<leader>xl` | n    | LSP refs/defs      |
| `<leader>xL` | n    | Location list      |
| `<leader>xQ` | n    | Quickfix list      |

---

## Neorg (`plugins/neorg.lua`)

### Custom

| Key          | Mode | Action            |
| ------------ | ---- | ----------------- |
| `<leader>ni` | n    | Neorg index       |
| `<leader>nr` | n    | Neorg return      |
| `<leader>nj` | n    | Journal today     |
| `<leader>nw` | n    | Workspace notes   |
| `<leader>nt` | n    | Table of contents |

### Defaults preset `neorg` — tous fichiers

| Key               | Mode | Action                                     |
| ----------------- | ---- | ------------------------------------------ |
| `<localleader>nn` | n    | Create new `.norg` note                    |
| `gO`              | n    | Table of contents (remappé → `<leader>nt`) |

### Defaults preset `neorg` — fichiers `.norg` uniquement

#### Normal mode

| Key               | Action                         |
| ----------------- | ------------------------------ |
| `<CR>`            | Jump to link                   |
| `<M-CR>`          | Jump to link (vertical split)  |
| `<M-t>`           | Jump to link (tab)             |
| `>.`              | Promote object (non-recursive) |
| `<,`              | Demote object (non-recursive)  |
| `>>`              | Promote object (recursive)     |
| `<<`              | Demote object (recursive)      |
| `<C-Space>`       | Cycle task state               |
| `<localleader>tu` | Mark task as undone            |
| `<localleader>tp` | Mark task as pending           |
| `<localleader>td` | Mark task as done              |
| `<localleader>th` | Mark task as on-hold           |
| `<localleader>tc` | Mark task as cancelled         |
| `<localleader>tr` | Mark task as recurring         |
| `<localleader>ti` | Mark task as important         |
| `<localleader>ta` | Mark task as ambiguous         |
| `<localleader>lt` | Toggle ordered/unordered list  |
| `<localleader>li` | Invert list                    |
| `<localleader>id` | Insert date                    |
| `<localleader>cm` | Magnify code block             |

#### Insert mode

| Key      | Action                          |
| -------- | ------------------------------- |
| `<C-t>`  | Promote object                  |
| `<C-d>`  | Demote object                   |
| `<M-CR>` | Continue object (new iteration) |
| `<M-d>`  | Insert date                     |

#### Visual mode

| Key | Action                   |
| --- | ------------------------ |
| `>` | Promote objects in range |
| `<` | Demote objects in range  |

---

## Blink CMP (`plugins/blink-cmp.lua`)

### Mode Insert — preset `default` + overrides

| Key               | Action                         |
| ----------------- | ------------------------------ |
| `<CR>`            | Accept suggestion              |
| `<Tab>`           | Select next / snippet forward  |
| `<S-Tab>`         | Select prev / snippet backward |
| `<C-n>`           | Select next                    |
| `<C-p>`           | Select prev                    |
| `<up>` / `<down>` | Select prev / next             |
| `<C-Space>`       | Show / hide documentation      |
| `<C-e>`           | Cancel                         |
| `<C-y>`           | Select and accept              |
| `<C-b>`           | Scroll documentation up        |
| `<C-f>`           | Scroll documentation down      |
| `<A-y>`           | Show Minuet AI suggestions     |

### Mode Cmdline — preset `cmdline`

| Key                 | Action               |
| ------------------- | -------------------- |
| `<Tab>`             | Show and select next |
| `<S-Tab>`           | Show and select prev |
| `<C-Space>`         | Show                 |
| `<C-n>` / `<right>` | Select next          |
| `<C-p>` / `<left>`  | Select prev          |
| `<C-y>`             | Accept               |
| `<C-e>`             | Cancel               |
| `<End>`             | Hide                 |

---

## Mini.surround (`plugins/mini.lua`)

| Key  | Mode | Action                        |
| ---- | ---- | ----------------------------- |
| `sa` | n/v  | Add surround (ex: `saiw"`)    |
| `sd` | n    | Delete surround (ex: `sd"`)   |
| `sr` | n    | Replace surround (ex: `sr"'`) |
| `sf` | n    | Find surround (right)         |
| `sF` | n    | Find surround (left)          |
| `sh` | n    | Highlight surround            |
| `sn` | n    | Update n lines                |

## Mini.pairs (`plugins/mini.lua`)

Auto-fermeture en mode insert : `(`, `[`, `{`, `"`, `'`, `` ` ``

| `]t` | n | Next todo comment |
| `[t` | n | Previous todo comment |

---

## Render Markdown (`plugins/render-markdown.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>mr` | n | Toggle markdown render |

---

## Treesitter Textobjects (`plugins/treesitter-textobjects.lua`)

### Selection (o/x)

| Key         | Action                  |
| ----------- | ----------------------- |
| `af` / `if` | Outer / inner function  |
| `ac` / `ic` | Outer / inner class     |
| `aa` / `ia` | Outer / inner parameter |

### Navigation (n/x/o)

| Key  | Action              |
| ---- | ------------------- |
| `]f` | Next function start |
| `]F` | Next function end   |
| `[f` | Prev function start |
| `[F` | Prev function end   |
| `]c` | Next class start    |
| `[c` | Prev class start    |

---

## Neorg Text Objects (`.norg` uniquement, o/x)

| Key      | Action         |
| -------- | -------------- |
| `iH`     | Inner heading  |
| `aH`     | Outer heading  |
| `<down>` | Move item down |
| `<up>`   | Move item up   |
