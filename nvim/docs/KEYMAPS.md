# Neovim Keymaps

> `<leader>` = `Space` | `<localleader>` = `Space Space`
> Ouvrir ce fichier : `<leader>hk`

---

## Vim — Mouvements de base

### Curseur

| Key       | Action                                    |
| --------- | ----------------------------------------- |
| `h` / `l` | Gauche / Droite                           |
| `j` / `k` | Bas / Haut (wrap-aware dans cette config) |
| `w` / `W` | Mot suivant (début)                       |
| `b` / `B` | Mot précédent (début)                     |
| `e` / `E` | Mot suivant (fin)                         |
| `0`       | Début de ligne (absolu)                   |
| `^`       | Premier caractère non-blanc               |
| `$`       | Fin de ligne                              |
| `H`       | Premier symbole de la ligne (remappé `^`) |
| `L`       | Dernier symbole de la ligne (remappé `$`) |
| `gg`      | Début du fichier                          |
| `G`       | Fin du fichier                            |
| `{` / `}` | Paragraphe précédent / suivant            |
| `%`       | Aller au bracket correspondant            |
| `gd`      | Goto definition (LSP)                     |
| `gi`      | Goto last insert position                 |
| `gf`      | Ouvrir le fichier sous le curseur         |

### Saut rapide

| Key        | Action                                     |
| ---------- | ------------------------------------------ |
| `f{c}`     | Aller au caractère `c` (ligne, forward)    |
| `F{c}`     | Aller au caractère `c` (ligne, backward)   |
| `t{c}`     | Avant le caractère `c` (forward)           |
| `T{c}`     | Avant le caractère `c` (backward)          |
| `;`        | Répéter `f`/`t` forward                    |
| `,`        | Répéter `f`/`t` backward                   |
| `*`        | Chercher le mot sous le curseur (forward)  |
| `#`        | Chercher le mot sous le curseur (backward) |
| `n` / `N`  | Occurrence suivante / précédente           |
| `<C-o>`    | Retour dans la jumplist                    |
| `<C-i>`    | Avancer dans la jumplist                   |
| `''`       | Retour à la dernière position              |
| `m{a}`     | Poser un mark `a`                          |
| `` `{a} `` | Aller au mark `a`                          |

### Écran

| Key     | Action                     |
| ------- | -------------------------- |
| `<C-d>` | Scroll bas (demi-page)     |
| `<C-u>` | Scroll haut (demi-page)    |
| `<C-f>` | Scroll bas (page entière)  |
| `<C-b>` | Scroll haut (page entière) |
| `zz`    | Centrer le curseur         |
| `zt`    | Curseur en haut            |
| `zb`    | Curseur en bas             |

---

## Vim — Modes

| Key     | Action                                    |
| ------- | ----------------------------------------- |
| `i`     | Insert avant le curseur                   |
| `I`     | Insert début de ligne                     |
| `a`     | Insert après le curseur                   |
| `A`     | Insert fin de ligne                       |
| `o`     | Nouvelle ligne dessous + insert           |
| `O`     | Nouvelle ligne dessus + insert            |
| `v`     | Visual mode (caractère)                   |
| `V`     | Visual mode (ligne)                       |
| `<C-v>` | Visual block mode (multi-curseur colonne) |
| `R`     | Replace mode                              |
| `<Esc>` | Normal mode                               |

---

## Vim — Édition

### Opérateurs (combinables avec mouvements)

| Key          | Action                       |
| ------------ | ---------------------------- |
| `d{motion}`  | Supprimer                    |
| `c{motion}`  | Changer (supprimer + insert) |
| `y{motion}`  | Yank (copier)                |
| `>{motion}`  | Indenter                     |
| `<{motion}`  | Désindenter                  |
| `={motion}`  | Auto-indenter                |
| `g~{motion}` | Toggle case                  |
| `gu{motion}` | Lowercase                    |
| `gU{motion}` | Uppercase                    |

### Raccourcis courants

| Key         | Action                                 |
| ----------- | -------------------------------------- |
| `dd`        | Supprimer la ligne                     |
| `yy`        | Copier la ligne                        |
| `cc`        | Changer la ligne                       |
| `D`         | Supprimer jusqu'à la fin de ligne      |
| `C`         | Changer jusqu'à la fin de ligne        |
| `Y`         | Copier jusqu'à la fin de ligne         |
| `x`         | Supprimer le caractère sous le curseur |
| `s`         | Supprimer le caractère + insert        |
| `p`         | Coller après                           |
| `P`         | Coller avant                           |
| `u`         | Undo                                   |
| `<C-r>`     | Redo                                   |
| `.`         | Répéter la dernière action             |
| `~`         | Toggle case du caractère               |
| `J`         | Joindre la ligne suivante              |
| `>>` / `<<` | Indenter / Désindenter la ligne        |

### Text objects (avec `d`, `c`, `y`, `v`...)

| Key                 | Action                               |
| ------------------- | ------------------------------------ |
| `iw` / `aw`         | Mot inner / outer                    |
| `is` / `as`         | Phrase inner / outer                 |
| `ip` / `ap`         | Paragraphe inner / outer             |
| `i"` / `a"`         | Guillemets inner / outer             |
| `i'` / `a'`         | Apostrophes inner / outer            |
| `` i` `` / `` a` `` | Backticks inner / outer              |
| `i(` / `a(`         | Parenthèses inner / outer            |
| `i[` / `a[`         | Crochets inner / outer               |
| `i{` / `a{`         | Accolades inner / outer              |
| `it` / `at`         | Tag HTML inner / outer               |
| `if` / `af`         | Fonction inner / outer (treesitter)  |
| `ic` / `ac`         | Classe inner / outer (treesitter)    |
| `ia` / `aa`         | Paramètre inner / outer (treesitter) |
| `iH` / `aH`         | Heading inner / outer (neorg)        |

### Recherche & remplacement

| Key              | Action                            |
| ---------------- | --------------------------------- |
| `/{pattern}`     | Chercher forward                  |
| `?{pattern}`     | Chercher backward                 |
| `:%s/old/new/g`  | Remplacer global                  |
| `:%s/old/new/gc` | Remplacer avec confirmation       |
| `:s/old/new/g`   | Remplacer sur la ligne            |
| `<leader>c`      | Effacer le highlight de recherche |

### Multi-ligne / Visual block

| Key                 | Action                                                     |
| ------------------- | ---------------------------------------------------------- |
| `<C-v>` puis `I`    | Insert au début de chaque ligne sélectionnée               |
| `<C-v>` puis `A`    | Insert à la fin de chaque ligne sélectionnée               |
| `<C-v>` puis `d`    | Supprimer le bloc                                          |
| `<C-v>` puis `r{c}` | Remplacer le bloc par `c`                                  |
| `gn`                | Sélectionner la prochaine occurrence (combinable avec `.`) |

### Duplication de ligne

| Key   | Action                     |
| ----- | -------------------------- |
| `yyp` | Dupliquer la ligne dessous |
| `yyP` | Dupliquer la ligne dessus  |

---

## Vim — Fenêtres / Onglets

| Key           | Action                        |
| ------------- | ----------------------------- |
| `<leader>wh`  | Split horizontal              |
| `<leader>wv`  | Split vertical                |
| `<leader>q`   | Fermer la fenêtre             |
| `<C-h/j/k/l>` | Naviguer entre les splits     |
| `<C-w>=`      | Égaliser la taille des splits |
| `<C-w>_`      | Maximiser hauteur             |
| `<C-w>\|`     | Maximiser largeur             |
| `<tab>`       | Buffer suivant                |
| `<S-tab>`     | Buffer précédent              |

---

## Vim — Macros & registres

| Key     | Action                         |
| ------- | ------------------------------ |
| `q{a}`  | Enregistrer une macro dans `a` |
| `q`     | Arrêter l'enregistrement       |
| `@{a}`  | Exécuter la macro `a`          |
| `@@`    | Répéter la dernière macro      |
| `"{a}y` | Yank dans le registre `a`      |
| `"{a}p` | Coller depuis le registre `a`  |
| `:reg`  | Voir tous les registres        |

---

## Core (`keymaps.lua`)

| Key           | Mode | Action                 |
| ------------- | ---- | ---------------------- |
| `<leader>s`   | n    | Save file              |
| `<leader>c`   | n    | Clear search highlight |
| `<leader>t`   | n    | Open terminal          |
| `<leader>wh`  | n    | Split horizontal       |
| `<leader>wv`  | n    | Split vertical         |
| `<leader>q`   | n    | Kill window            |
| `<C-h/j/k/l>` | n    | Naviguer splits        |
| `<tab>`       | n    | Buffer suivant         |
| `<S-tab>`     | n    | Buffer précédent       |
| `<tab>`       | v    | Indenter               |
| `<S-tab>`     | v    | Désindenter            |
| `H`           | n    | Premier symbole (`^`)  |
| `L`           | n    | Dernier symbole (`$`)  |
| `<leader>hk`  | n    | Ouvrir ce fichier      |

---

## Snacks (`plugins/snacks.lua`)

### Picker — Files

| Key          | Mode | Action                 |
| ------------ | ---- | ---------------------- |
| `<leader>ff` | n    | Find files             |
| `<leader>fg` | n    | Live grep              |
| `<leader>fb` | n    | Buffers                |
| `<leader>fh` | n    | Help tags              |
| `<leader>fr` | n    | Recent files           |
| `<leader>fc` | n    | Commands               |
| `<leader>fd` | n    | Diagnostics            |
| `<leader>fs` | n    | LSP symbols            |
| `<leader>fw` | n/x  | Grep word sous curseur |
| `<leader>ft` | n    | Todo comments          |

### Explorer

| Key         | Mode | Action        |
| ----------- | ---- | ------------- |
| `<leader>e` | n    | File explorer |

### Git

| Key          | Mode | Action          |
| ------------ | ---- | --------------- |
| `<leader>gg` | n    | Lazygit         |
| `<leader>gb` | n/v  | Open in browser |
| `<leader>gl` | n    | Git log         |
| `<leader>gs` | n    | Git status      |
| `<leader>gd` | n    | Git diff        |

### Buffers

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

| Key         | Mode | Action                 |
| ----------- | ---- | ---------------------- |
| `<leader>z` | n    | Zen mode               |
| `]r`        | n/t  | Next LSP reference     |
| `[r`        | n/t  | Previous LSP reference |

### Picker — fenêtre input

| Key                | Action             |
| ------------------ | ------------------ |
| `<CR>`             | Confirm            |
| `<C-j>` / `<down>` | List down          |
| `<C-k>` / `<up>`   | List up            |
| `<S-CR>`           | Pick window + jump |
| `<Esc>` (n)        | Cancel             |
| `<C-c>` (i)        | Cancel             |
| `/`                | Toggle focus       |
| `<C-w>` (i)        | Delete word        |

### Picker — fenêtre list

| Key        | Action           |
| ---------- | ---------------- |
| `j` / `k`  | Down / Up        |
| `gg` / `G` | Top / Bottom     |
| `i`        | Focus input      |
| `q`        | Cancel           |
| `?`        | Toggle help      |
| `<C-v>`    | Edit vsplit      |
| `<C-s>`    | Edit split       |
| `<C-t>`    | Open in tab      |
| `<C-q>`    | Send to quickfix |

### Explorer (fenêtre list)

| Key | Action          |
| --- | --------------- |
| `l` | Open / confirm  |
| `h` | Close directory |
| `a` | Add             |
| `d` | Delete          |
| `r` | Rename          |
| `c` | Copy            |
| `m` | Move            |
| `y` | Yank path       |
| `p` | Paste           |
| `P` | Toggle preview  |
| `I` | Toggle ignored  |
| `H` | Toggle hidden   |
| `/` | Grep in dir     |

---

## LSP (`plugins/nvim-lspconfig.lua`)

| Key          | Mode | Action                |
| ------------ | ---- | --------------------- |
| `gd`         | n    | Goto definition       |
| `gl`         | n    | Show line diagnostics |
| `[d`         | n    | Previous diagnostic   |
| `]d`         | n    | Next diagnostic       |
| `<leader>lr` | n    | Goto references       |
| `<leader>li` | n    | Goto implementation   |
| `<leader>lt` | n    | Goto type definition  |
| `<leader>pa` | n    | Code action           |
| `<leader>pr` | n    | Rename symbol         |
| `<leader>pf` | n    | Format                |
| `<leader>ps` | n    | Workspace symbol      |
| `<leader>pd` | n    | Diagnostics list      |
| `K`          | n    | Hover documentation   |
| `<C-k>`      | i    | Signature help        |

---

## Gitsigns (`plugins/gitsigns.lua`)

| Key          | Mode | Action        |
| ------------ | ---- | ------------- |
| `]h`         | n    | Next hunk     |
| `[h`         | n    | Previous hunk |
| `<leader>hs` | n/v  | Stage hunk    |
| `<leader>hr` | n/v  | Reset hunk    |
| `<leader>hS` | n    | Stage buffer  |
| `<leader>hR` | n    | Reset buffer  |
| `<leader>hp` | n    | Preview hunk  |
| `<leader>hb` | n    | Blame line    |
| `<leader>hd` | n    | Diff this     |

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

## Todo Comments (`plugins/todo-comments.lua`)

| Key          | Mode | Action        |
| ------------ | ---- | ------------- |
| `]t`         | n    | Next todo     |
| `[t`         | n    | Previous todo |
| `<leader>ft` | n    | Picker todos  |

---

## Render Markdown (`plugins/render-markdown.lua`)

| Key          | Mode | Action                 |
| ------------ | ---- | ---------------------- |
| `<leader>mr` | n    | Toggle markdown render |

---

## Neorg (`plugins/neorg.lua`)

### Custom

| Key          | Mode | Action            |
| ------------ | ---- | ----------------- |
| `<leader>ni` | n    | Index             |
| `<leader>nr` | n    | Return            |
| `<leader>nj` | n    | Journal today     |
| `<leader>nw` | n    | Workspace notes   |
| `<leader>nt` | n    | Table of contents |

### Defaults — tous fichiers

| Key               | Mode | Action          |
| ----------------- | ---- | --------------- |
| `<localleader>nn` | n    | Create new note |

### Defaults — fichiers `.norg` uniquement

#### Normal mode

| Key               | Action                          |
| ----------------- | ------------------------------- |
| `<CR>`            | Jump to link                    |
| `<M-CR>`          | Jump to link (vsplit)           |
| `<M-t>`           | Jump to link (tab)              |
| `>.` / `<,`       | Promote / Demote (non-récursif) |
| `>>` / `<<`       | Promote / Demote (récursif)     |
| `<C-Space>`       | Cycle task state                |
| `<localleader>tu` | Task undone                     |
| `<localleader>tp` | Task pending                    |
| `<localleader>td` | Task done                       |
| `<localleader>th` | Task on-hold                    |
| `<localleader>tc` | Task cancelled                  |
| `<localleader>tr` | Task recurring                  |
| `<localleader>ti` | Task important                  |
| `<localleader>ta` | Task ambiguous                  |
| `<localleader>lt` | Toggle ordered/unordered list   |
| `<localleader>li` | Invert list                     |
| `<localleader>id` | Insert date                     |
| `<localleader>cm` | Magnify code block              |

#### Insert mode

| Key      | Action          |
| -------- | --------------- |
| `<C-t>`  | Promote         |
| `<C-d>`  | Demote          |
| `<M-CR>` | Continue object |
| `<M-d>`  | Insert date     |

#### Visual mode

| Key | Action        |
| --- | ------------- |
| `>` | Promote range |
| `<` | Demote range  |

---

## Blink CMP (`plugins/blink-cmp.lua`)

### Insert

| Key                 | Action                |
| ------------------- | --------------------- |
| `<CR>`              | Accept                |
| `<Tab>` / `<S-Tab>` | Select next / prev    |
| `<C-n>` / `<C-p>`   | Select next / prev    |
| `<up>` / `<down>`   | Select prev / next    |
| `<C-Space>`         | Show / hide doc       |
| `<C-e>`             | Cancel                |
| `<C-y>`             | Accept                |
| `<C-b>` / `<C-f>`   | Scroll doc haut / bas |
| `<A-y>`             | Show Minuet AI        |

### Cmdline

| Key                 | Action                    |
| ------------------- | ------------------------- |
| `<Tab>` / `<S-Tab>` | Show + select next / prev |
| `<C-n>` / `<C-p>`   | Select next / prev        |
| `<C-y>`             | Accept                    |
| `<C-e>`             | Cancel                    |

---

## Mini.surround (`plugins/mini.lua`)

| Key          | Mode | Action                     |
| ------------ | ---- | -------------------------- |
| `sa{motion}` | n/v  | Add surround               |
| `sd`         | n    | Delete surround            |
| `sr`         | n    | Replace surround           |
| `sf` / `sF`  | n    | Find surround right / left |
| `sh`         | n    | Highlight surround         |

**Exemples :** `saiw"` → entoure le mot de `"` | `sd"` → supprime `"` | `sr"'` → remplace `"` par `'`

---

## Treesitter Textobjects (`plugins/treesitter-textobjects.lua`)

### Sélection (o/x)

| Key         | Action                  |
| ----------- | ----------------------- |
| `af` / `if` | Outer / inner function  |
| `ac` / `ic` | Outer / inner class     |
| `aa` / `ia` | Outer / inner paramètre |

### Navigation (n/x/o)

| Key         | Action                     |
| ----------- | -------------------------- |
| `]f` / `[f` | Next / prev function start |
| `]F` / `[F` | Next / prev function end   |
| `]c` / `[c` | Next / prev class start    |

---

## Neorg Text Objects (`.norg`, o/x)

| Key               | Action                |
| ----------------- | --------------------- |
| `iH` / `aH`       | Inner / outer heading |
| `<down>` / `<up>` | Move item down / up   |
