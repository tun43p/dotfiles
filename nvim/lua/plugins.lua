--alias vim functions
local call = vim.call
local Plug = vim.fn["plug#"]

call("plug#begin")

-- theme
Plug "tomasiser/vim-code-dark"

-- status line
Plug 'nvim-lualine/lualine.nvim'

-- icons
Plug 'kyazdani42/nvim-web-devicons'

-- file manager
Plug "kyazdani42/nvim-tree.lua"

-- show vim changes in gutter 
Plug "airblade/vim-gitgutter"

-- intelisense
Plug("neoclide/coc.nvim", {branch = "release"})

-- better syntax highlights 
Plug "sheerun/vim-polyglot"

-- auto pairs
Plug "jiangmiao/auto-pairs"

-- show hex and rgb colors
Plug "norcalli/nvim-colorizer.lua"

-- quick comment utility
Plug "tpope/vim-commentary"

-- quick edit surround
-- Plug "tpope/vim-surround" -- TODO: learn

-- show rainbow brackets
Plug "luochen1990/rainbow" -- TODO: learn

-- show tagbar 
Plug "preservim/tagbar" -- TODO: learn

-- git lens like
-- Plug "APZelos/blamer.nvim" -- TODO: learn

-- better javascript
Plug "pangloss/vim-javascript"

call("plug#end")

-- require plugins config
require("plugins/coc")
require("plugins/colorizer") -- replace with coc-highlight ?
require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/rainbow")

-- Plug "joereynolds/vim-minisnip"
-- Plug "nvim-lua/plenary.nvim"
-- Plug "nvim-telescope/telescope.nvim"
-- Plug "szw/vim-maximizer"

