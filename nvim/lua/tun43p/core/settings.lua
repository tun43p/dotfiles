-- set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- set highlight on search
vim.o.hlsearch = true

-- show line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- sync clipboard between os and neovim
vim.o.clipboard = "unnamedplus"

-- enable break indent
vim.o.breakindent = true

-- disable backup or swap files
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- save undo history
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- case sensitive searching unless \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- dicrease update time
vim.o.updatetime = 250

-- set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- don't show modes
vim.opt.showmode = false

-- open splits on the right and below
vim.opt.splitbelow = true
vim.opt.splitright = true

-- update vim after file update from outside
vim.opt.autoread = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- always use spaces instead of tabes
vim.opt.expandtab = true

-- TODO: check documentation
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.showbreak = "↳"

-- start scrolling when we are 8 lines aways from borders
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 5

-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- NOTE: copilot desactive, utilisation de Claude Code
-- vim.g.copilot_no_tab_map = true
