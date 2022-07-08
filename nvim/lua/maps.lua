-- function to make mapping easier
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map leader key to space
vim.g.mapleader = " "

-- split horizontaly and verticaly
map("n", "<leader>b", ":split<cr>")
map("n", "<leader>v", ":vsplit<cr>")

-- clear highlights with mapping
map("n", "<leader>c", ":match none <cr> :noh <cr>h")

-- navigate between tabs
map("n", "<tab>", "gT")
map("n", "<leader><tab>", ":tabnew<cr>")
map("n", "<leader>qq", ":tabclose<cr>")

-- navigate between splits
map("n", "<c-h>", "<c-w><c-h>")
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-left>", "<c-w><c-h>")
map("n", "<c-down>", "<c-w><c-j>")
map("n", "<c-up>", "<c-w><c-k>")
map("n", "<c-right>", "<c-w><c-l>")

map ("n", "<leader>h", ":bp<cr>")
map ("n", "<leader>l", ":bn<cr>")
map ("n", "<leader><left>", ":bp<cr>")
map ("n", "<leader><right>", ":bn<cr>")

-- search and replace
map("n", "<c-g>", ":%s/")

-- disable help menu
map("n", "<f1>", "<nop>")
map("v", "<f1>", "<nop>")
map("n", "q:", "<nop>")

-- map ctrl + s to :w
map("n", "<c-s>", ":w<cr>")
map("i", "<c-s>", "<esc>:w<cr>")

-- toggle nvim tree
map("n", "<leader>t", ":NvimTreeToggle<cr>")

-- coc mapping {{{1

map("n", "gd", "<Plug>(coc-definition)")
map("n", "gy", "<Plug>(coc-type-definition)")
map("n", "gi", "<Plug>(coc-implementation)")
map("n", "gr", "<Plug>(coc-references)")

-- }}}
