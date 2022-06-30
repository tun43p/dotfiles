-- alias vim functions
local cmd = vim.cmd
local opt = vim.opt

-- set filetype
cmd "filetype plugin indent on"

-- set default shell
opt.shell = "/usr/bin/fish"

-- set encoding
opt.encoding = "utf-8"
opt.fileencodings = "utf-8"
opt.langmenu = "en_US"

-- set fileformat
opt.fileformat = "unix" -- or "dos"

-- enable mouse support
opt.mouse = "a"

-- set autocomplete option
opt.completeopt="menuone,noinsert,noselect"

-- set status mode
opt.laststatus = 2

-- set scroll line limit
opt.scrolloff = 5

-- enable global clipboard
opt.clipboard = "unnamedplus" -- or "unamed"

-- configure folding method
opt.foldmethod = "marker" -- or "indent"

-- set terminal's title according to file name
opt.title = true

-- configure command bar height
opt.cmdheight = 1

-- configure update time
opt.updatetime = 300

-- disable default bottom ruler
opt.ruler = true

-- configure number column
opt.number = true
opt.relativenumber = true

-- set indentation stuff
opt.backspace = "indent,eol,start"
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 0 -- or 2
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

-- set searching stuff
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = false

-- disable backup and swap
opt.swapfile = false
opt.writebackup = false

-- disable line wrapping
opt.wrap = false

-- disable lazy redraw
opt.lazyredraw = false

-- disable beeping
opt.errorbells = false
opt.vb = false

-- disable some showings
opt.showcmd = false
opt.showmode = false

-- configure split method
opt.splitbelow = true
opt.splitright = true

-- less input lags
opt.ttimeoutlen = 100

-- enable cursor line
opt.cursorline = true

-- autoread file, if the file is changed outside of vim, it will ask you if you Want to reload it
opt.autoread = true

-- Set undolevel to max
-- opt.undolevels = 9999

-- set diff panel direction
-- opt.diffopt += "vertical"

-- don't give ins-completion-menu messages
-- opt.shortmess += "c"

-- view if is needed 
-- opt.backspace = 2
-- opt.hidden = true
-- opt.signcolumn = "yes
