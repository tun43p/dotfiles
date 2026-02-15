# Neovim Configuration

Configuration Neovim personnelle utilisant [lazy.nvim](https://github.com/folke/lazy.nvim) comme gestionnaire de plugins.

## Structure

```txt
nvim/
├── init.lua                          # Point d'entree
├── lua/tun43p/
│   ├── core/
│   │   ├── init.lua                  # Charge settings + keymaps
│   │   ├── settings.lua              # Options generales
│   │   └── keymaps.lua               # Raccourcis globaux
│   ├── plugins/                      # Un fichier par plugin (lazy.nvim)
│   │   ├── snacks.lua
│   │   ├── claudecode.lua
│   │   ├── treesitter.lua
│   │   ├── nvim-lspconfig.lua
│   │   ├── nvim-cmp.lua
│   │   ├── conform-nvim.lua
│   │   ├── nvim-lint.lua
│   │   ├── lualine.lua
│   │   ├── bufferline.lua
│   │   ├── gitsigns.lua
│   │   ├── which-key.lua
│   │   ├── mini.lua
│   │   └── vim-code-dark.lua         # Desactive (remplace par tokyonight)
│   ├── cmds.lua                      # Commandes custom
│   └── utils/
│       └── export_lsp_servers.lua
└── lazy-lock.json
```

## Plugins

### snacks.nvim

**Fichier :** `plugins/snacks.lua`
**Repository :** [folke/snacks.nvim](https://github.com/folke/snacks.nvim)

Collection d'utilitaires Neovim par folke. Remplace telescope, neo-tree et noice dans cette config.

**Modules actives :**

| Module         | Description                                               |
| -------------- | --------------------------------------------------------- |
| `explorer`     | Explorateur de fichiers (remplace neo-tree)               |
| `picker`       | Recherche de fichiers, grep, buffers (remplace telescope) |
| `notifier`     | Notifications (remplace noice + nvim-notify)              |
| `input`        | Meilleur `vim.ui.input`                                   |
| `terminal`     | Terminal flottant/split (utilise par claudecode.nvim)     |
| `bigfile`      | Desactive les features lourdes sur les gros fichiers      |
| `quickfile`    | Rendu rapide a l'ouverture depuis le shell                |
| `indent`       | Guides d'indentation                                      |
| `scope`        | Detection de scope via treesitter                         |
| `words`        | Navigation entre references LSP                           |
| `bufdelete`    | Suppression de buffers sans casser le layout              |
| `gitbrowse`    | Ouvrir fichier/branche/commit dans le navigateur          |
| `git`          | Utilitaires git                                           |
| `scroll`       | Smooth scrolling                                          |
| `statuscolumn` | Colonne de statut amelioree                               |
| `toggle`       | Toggle keymaps (integre avec which-key)                   |
| `dim`          | Dim les scopes inactifs                                   |
| `zen`          | Mode zen / distraction-free                               |

**Raccourcis :**

| Raccourci    | Action                       |
| ------------ | ---------------------------- |
| `<leader>ff` | Chercher des fichiers        |
| `<leader>fg` | Grep dans le projet          |
| `<leader>fb` | Lister les buffers           |
| `<leader>fh` | Chercher dans l'aide         |
| `<leader>fr` | Fichiers recents             |
| `<leader>fc` | Commandes                    |
| `<leader>fd` | Diagnostics                  |
| `<leader>fs` | Symboles LSP                 |
| `<leader>fw` | Grep le mot sous le curseur  |
| `<leader>e`  | Explorateur de fichiers      |
| `<leader>gb` | Ouvrir dans le navigateur    |
| `<leader>gl` | Git log                      |
| `<leader>gs` | Git status                   |
| `<leader>gd` | Git diff                     |
| `<leader>bd` | Supprimer le buffer courant  |
| `<leader>ba` | Supprimer tous les buffers   |
| `<leader>bo` | Supprimer les autres buffers |
| `<leader>nh` | Historique des notifications |
| `<leader>nd` | Fermer les notifications     |
| `<leader>z`  | Mode zen                     |
| `]]`         | Reference LSP suivante       |
| `[[`         | Reference LSP precedente     |

---

### claudecode.nvim

**Fichier :** `plugins/claudecode.lua`
**Repository :** [coder/claudecode.nvim](https://github.com/coder/claudecode.nvim)

Integration de Claude Code dans Neovim. Ouvre un terminal Claude dans un split via snacks.terminal.

**Prerequis :** CLI `claude` installe sur la machine.

**Raccourcis :**

| Raccourci    | Mode | Action                                |
| ------------ | ---- | ------------------------------------- |
| `<leader>ac` | n    | Ouvrir/fermer le terminal Claude      |
| `<leader>af` | n    | Focus sur le terminal Claude          |
| `<leader>ar` | n    | Reprendre une session                 |
| `<leader>aC` | n    | Continuer une session                 |
| `<leader>am` | n    | Selectionner le modele                |
| `<leader>ab` | n    | Ajouter le buffer courant au contexte |
| `<leader>as` | v    | Envoyer la selection a Claude         |
| `<leader>as` | n    | Ajouter fichier depuis l'explorateur  |
| `<leader>aa` | n    | Accepter un diff                      |
| `<leader>ad` | n    | Rejeter un diff                       |

---

### tokyonight.nvim (theme)

**Fichier :** `plugins/vim-code-dark.lua`
**Repository :** [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

Theme de couleurs avec support natif pour snacks, lualine, bufferline, gitsigns et treesitter.

**Configuration :**

- Style : `night`
- Fond transparent active
- Commentaires et mots-cles en italique
- Sidebars et floats transparents

---

### nvim-treesitter

**Fichier :** `plugins/treesitter.lua`
**Repository :** [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Highlighting syntaxique avance, indentation intelligente et selection incrementale base sur l'arbre syntaxique.

**Langages installes :** astro, bash, c, cmake, cpp, css, dockerfile, go, gomod, graphql, html, javascript, json, kotlin, lua, markdown, markdown_inline, prisma, python, regex, scss, svelte, toml, tsx, typescript, vim, vimdoc, yaml.

**Raccourcis :**

| Raccourci   | Action                            |
| ----------- | --------------------------------- |
| `<C-space>` | Selection incrementale (agrandir) |
| `<BS>`      | Selection incrementale (reduire)  |

---

### nvim-lspconfig + Mason

**Fichier :** `plugins/nvim-lspconfig.lua`
**Repository :** [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Configuration LSP avec installation automatique des serveurs via Mason.

**Serveurs installes :** bashls, clangd, cmake, dockerls, docker_compose_language_service, jsonls, lua_ls, marksman, yamlls.

**Raccourcis :**

| Raccourci    | Action                         |
| ------------ | ------------------------------ |
| `gd`         | Aller a la definition          |
| `gr`         | Voir les references            |
| `gi`         | Aller a l'implementation       |
| `gt`         | Aller a la definition de type  |
| `gl`         | Diagnostics de la ligne        |
| `[d` / `]d`  | Diagnostic precedent / suivant |
| `K`          | Documentation hover            |
| `<C-k>`      | Aide signature (insert mode)   |
| `<leader>pa` | Actions de code                |
| `<leader>pr` | Renommer                       |
| `<leader>pf` | Formater                       |
| `<leader>ps` | Symboles du workspace          |
| `<leader>pd` | Liste des diagnostics          |

---

### nvim-cmp

**Fichier :** `plugins/nvim-cmp.lua`
**Repository :** [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Autocompletion avec support LSP, snippets (LuaSnip), buffers et chemins.

**Sources :** nvim_lsp, luasnip, buffer, path.

**Raccourcis :**

| Raccourci   | Action                             |
| ----------- | ---------------------------------- |
| `<C-p>`     | Item precedent                     |
| `<C-n>`     | Item suivant                       |
| `<CR>`      | Confirmer la selection             |
| `<C-Space>` | Ouvrir le menu de completion       |
| `<Tab>`     | Item suivant / expand snippet      |
| `<S-Tab>`   | Item precedent / snippet precedent |

---

### conform.nvim

**Fichier :** `plugins/conform-nvim.lua`
**Repository :** [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

Formatage automatique a la sauvegarde.

**Formatteurs configures :**

| Langage                     | Formatteur          |
| --------------------------- | ------------------- |
| JavaScript/TypeScript/React | prettierd, prettier |
| CSS/SCSS                    | prettierd, prettier |
| HTML                        | htmlbeautifier      |
| JSON/YAML/Markdown          | prettierd, prettier |
| Lua                         | stylua              |
| Python                      | ruff                |
| Go                          | gofumpt             |
| C/C++                       | clang-format        |
| Kotlin                      | ktlint              |
| Astro/Svelte                | prettierd, prettier |

---

### nvim-lint

**Fichier :** `plugins/nvim-lint.lua`
**Repository :** [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)

Linting asynchrone declenche a l'entree/sortie de buffer et a la sauvegarde.

**Linters configures :**

| Langage                     | Linter        |
| --------------------------- | ------------- |
| JavaScript/TypeScript/React | eslint_d      |
| CSS/SCSS/Svelte/Astro       | eslint_d      |
| Python                      | ruff          |
| Go                          | golangci-lint |
| C/C++                       | cpplint       |
| Kotlin                      | ktlint        |
| JSON                        | jsonlint      |
| YAML                        | yamllint      |
| Markdown                    | markdownlint  |
| HTML                        | htmlhint      |
| CMake                       | cmakelint     |

---

### lualine.nvim

**Fichier :** `plugins/lualine.lua`
**Repository :** [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

Barre de statut en bas de l'ecran.

**Sections :**

- **A** : Mode (abrege a 3 caracteres)
- **B** : Branche git + diff (ajouts/modifications/suppressions)
- **C** : Diagnostics + icone filetype + nom du fichier (chemin relatif)
- **X** : Serveur(s) LSP actif(s)
- **Y** : Encoding + format de fichier
- **Z** : Progression + position dans le fichier

---

### bufferline.nvim

**Fichier :** `plugins/bufferline.lua`
**Repository :** [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

Barre d'onglets en haut de l'ecran avec diagnostics LSP et icones.

**Configuration :**

- Affichage des diagnostics LSP sur chaque onglet
- Offset pour l'explorateur snacks
- Tri par insertion apres le buffer courant

---

### gitsigns.nvim

**Fichier :** `plugins/gitsigns.lua`
**Repository :** [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Signes git dans le gutter (ajout, modification, suppression) et blame inline.

**Configuration :**

- Blame de la ligne courante affiche en temps reel
- Support des hunks staged

**Raccourcis :**

| Raccourci    | Action                    |
| ------------ | ------------------------- |
| `]h` / `[h`  | Hunk suivant / precedent  |
| `<leader>hs` | Stage hunk                |
| `<leader>hr` | Reset hunk                |
| `<leader>hS` | Stage tout le buffer      |
| `<leader>hu` | Undo stage hunk           |
| `<leader>hR` | Reset tout le buffer      |
| `<leader>hp` | Preview du hunk           |
| `<leader>hb` | Blame complet de la ligne |
| `<leader>hd` | Diff du fichier           |

---

### mini.pairs + mini.surround

**Fichier :** `plugins/mini.lua`
**Repository :** [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim)

**mini.pairs** : Fermeture automatique des paires `()`, `[]`, `{}`, `""`, `''`, ` ` ``.

**mini.surround** : Gestion des caracteres entourants.

| Raccourci | Action                        | Exemple                          |
| --------- | ----------------------------- | -------------------------------- |
| `sa`      | Ajouter un surround           | `saiw"` ajoute `"` autour du mot |
| `sd`      | Supprimer un surround         | `sd"` supprime les `"`           |
| `sr`      | Remplacer un surround         | `sr"'` remplace `"` par `'`      |
| `sf`      | Trouver le surround suivant   |                                  |
| `sF`      | Trouver le surround precedent |                                  |
| `sh`      | Highlight le surround         |                                  |

---

### which-key.nvim

**Fichier :** `plugins/which-key.lua`
**Repository :** [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

Affiche un popup avec les raccourcis disponibles apres avoir appuye sur une touche leader. Timeout de 300ms.

---

## Raccourcis globaux (keymaps.lua)

| Raccourci           | Mode | Action                             |
| ------------------- | ---- | ---------------------------------- |
| `<leader>s`         | n    | Sauvegarder                        |
| `H` / `L`           | n    | Debut / fin de ligne               |
| `<leader>q`         | n    | Fermer la fenetre                  |
| `<leader>b`         | n    | Split horizontal                   |
| `<leader>v`         | n    | Split vertical                     |
| `<leader>h/j/k/l`   | n    | Naviguer entre les splits          |
| `<Tab>` / `<S-Tab>` | n    | Buffer suivant / precedent         |
| `<leader>x`         | n    | Fermer le buffer courant           |
| `<leader>X`         | n    | Fermer tous les autres buffers     |
| `<Tab>` / `<S-Tab>` | v    | Indenter / desindenter             |
| `<leader>c`         | n    | Effacer le surlignage de recherche |
| `<leader>t`         | n    | Ouvrir un terminal (snacks)        |

## Plugins desactives (commentes)

- **vim-code-dark** : Ancien theme, remplace par tokyonight
- **windsurf.nvim** (Codeium) : AI completion, remplace par Claude Code
- **copilot** : Keymaps commentes dans keymaps.lua et settings.lua
