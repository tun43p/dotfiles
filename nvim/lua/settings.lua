-- shell, encoding and file options {{{1

-- set filetype
vim.cmd "filetype plugin indent on"

-- set default shell
vim.opt.shell = "/usr/bin/fish"

-- set encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.langmenu = "en_US"

-- set fileformat
vim.opt.fileformat = "unix" -- or "dos"

-- }}}

-- misc configuration {{{1

-- enable mouse support
vim.opt.mouse = "a"

-- enable global clipboard
vim.opt.clipboard = "unnamedplus" -- or "unamed"

-- configure folding method
vim.opt.foldmethod = "marker" -- or "indent"

-- set autocomplete option
vim.opt.completeopt="menuone,noinsert,noselect"

-- set backspace option
vim.opt.backspace = "indent,eol,start"

-- configure update time
vim.opt.updatetime = 300

-- less input lags
vim.opt.ttimeoutlen = 100

-- set scroll line limit
vim.opt.scrolloff = 5

-- autoread file, if the file is changed outside of vim, it will ask you if you Want to reload it
vim.opt.autoread = true

-- set searching stuff
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = false

-- }}}

-- status and command line {{{1

-- set one status for all splits
vim.opt.laststatus = 3 -- or 2 for all split

-- configure command bar height
vim.opt.cmdheight = 1

-- }}}

-- interface stuff {{{1

-- set terminal's title according to file name
vim.opt.title = true

-- disable default bottom ruler
vim.opt.ruler = true

-- configure number column
vim.opt.number = true
vim.opt.relativenumber = true

-- enable cursor line
vim.opt.cursorline = true

-- configure split method
vim.opt.splitbelow = true
vim.opt.splitright = true

-- }}}

-- disabling stuff {{{1

-- disable backup and swap
vim.opt.swapfile = false
vim.opt.writebackup = false

-- disable line wrapping
vim.opt.wrap = false

-- disable lazy redraw
vim.opt.lazyredraw = false

-- disable beeping
vim.opt.errorbells = false
vim.opt.vb = false

-- disable some showings
vim.opt.showcmd = false
vim.opt.showmode = false

-- }}}

-- indentation configuration {{{1

-- configure tab size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0 -- or 2

-- configure other indentation stuff
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true

-- }}}

-- provider stuff {{{1

-- set python provider path
vim.g.python3_host_prog = "/usr/bin/python3"

-- disable perl provider
vim.g.loaded_perl_provider = 0

-- }}}

-- good to know {{{1

-- vim.opt.undolevels = 9999
-- vim.opt.diffopt += "vertical"
-- vim.opt.shortmess += "c"
-- vim.opt.backspace = 2
-- vim.opt.hidden = true
-- vim.opt.signcolumn = "yes

-- }}}




