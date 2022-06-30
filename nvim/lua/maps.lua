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
