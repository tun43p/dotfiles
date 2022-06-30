-- alias vim functions
local call = vim.call
local Plug = vim.fn["plug#"]

call("plug#begin")

-- theme
Plug "tomasiser/vim-code-dark"

-- status line
Plug 'nvim-lualine/lualine.nvim'

-- show vim changes in gutter 
Plug "airblade/vim-gitgutter"

-- better syntax highlights 
Plug "sheerun/vim-polyglot"

-- auto pairs
Plug "jiangmiao/auto-pairs"

-- show hex and rgb colors
Plug "norcalli/nvim-colorizer.lua"

-- quick comment utility
Plug "tpope/vim-commentary"

-- quick edit surround
Plug "tpope/vim-surround"

-- maximize current window
Plug "szw/vim-maximizer"

-- show rainbow brackets
Plug "luochen1990/rainbow"

-- git lens like
Plug "APZelos/blamer.nvim"

-- better javascript
Plug "pangloss/vim-javascript"

-- icons
Plug 'kyazdani42/nvim-web-devicons'
-- Plug "kyazdani42/nvim-tree.lua"

call("plug#end")

-- plugins to check
-- Plug("neoclide/coc.nvim", {branch = "release"})
-- Plug "joereynolds/vim-minisnip"
-- Plug "nvim-lua/plenary.nvim"
-- Plug "nvim-telescope/telescope.nvim"
