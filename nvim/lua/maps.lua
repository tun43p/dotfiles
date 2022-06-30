-- function to make mapping easier
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map leader key to space
vim.g.mapleader = " "

-- split horizontaly and verticaly
map("n", "<Leader>h", ":split<CR>")
map("n", "<Leader>v", ":vsplit<CR>")

-- clear highlights with mapping
map("n", "<Leader>c", ":match none <CR> :noh <CR>h")

-- navigate between tabs
map('n', "<tab>", "gT")
map('n', "<Leader><tab>", ":tabnew<CR>")
map('n', "<Leader>qq", ":tabclose<CR>")

-- navigate between splits
map("n", "<c-h>", "<c-w><c-h>")
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-left>", "<c-w><c-h>")
map("n", "<c-down>", "<c-w><c-j>")
map("n", "<c-up>", "<c-w><c-k>")
map("n", "<c-right>", "<c-w><c-l>")

-- search and replace
map('n', '<C-g>', ':%s/')

-- disable help menu
map('n', '<F1>', '<nop>')
map('v', '<F1>', '<nop>')
map('n', 'q:', '<nop>')

-- Map Ctrl + s to :w
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>')
