-- save the file with space + s
vim.keymap.set("n", "<leader>s", ":write<cr>", { silent = true, desc = "Save file" })

-- move normally between wrapped lines with k and j or up and down
vim.keymap.set(
	"n",
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move normally between bottom wrapped lines" }
)

vim.keymap.set(
	"n",
	"<up>",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move normally between bottom wrapped" }
)

vim.keymap.set(
	"n",
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move normally between upper wrapped lines" }
)

vim.keymap.set(
	"n",
	"<down>",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move normally between upper wrapped lines" }
)

-- move to the first and last symbols on the line with shift + h or shift + l
vim.keymap.set("n", "H", "^", { desc = "Move to first symbol" })
vim.keymap.set("n", "L", "$", { desc = "Move to last symbol" })

-- quit the current buffer with shift + q
vim.keymap.set("n", "<leader>q", "<c-w>q", { desc = "Kill window" })

-- open split with space + wh or wv
vim.keymap.set("n", "<leader>wh", "<c-w>s", { desc = "Open horizontal split" })
vim.keymap.set("n", "<leader>wv", "<c-w>v", { desc = "Open vertical split" })

-- jump between splits with ctrl + vim keys
vim.keymap.set("n", "<C-h>", "<c-w>h", { desc = "Jump to left split" })
vim.keymap.set("n", "<C-j>", "<c-w>j", { desc = "Jump to bottom split" })
vim.keymap.set("n", "<C-k>", "<c-w>k", { desc = "Jump to upper split" })
vim.keymap.set("n", "<C-l>", "<c-w>l", { desc = "Jump to right split" })

-- navigate between buffers with tab or shift + tab
vim.keymap.set("n", "<tab>", ":bn<cr>", { silent = true, desc = "Navigate to next buffer" })
vim.keymap.set("n", "<s-tab>", ":bp<cr>", { silent = true, desc = "Navigate to previous buffer" })

-- indenting in visual mode with tab or shift + tab
vim.keymap.set("v", "<tab>", ">gv", { desc = "Add a tabulation" })
vim.keymap.set("v", "<s-tab>", "<gv", { desc = "Remove a tabulation" })

-- mode to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- clean search highlight with space + c
vim.keymap.set("n", "<leader>c", ":noh<cr>", { silent = true, desc = "Clean search highlight" })

-- fixes pasting after visual selection
vim.keymap.set("v", "p", '"_dP', { desc = "Paste" })

-- open terminal with snacks (space + t)
vim.keymap.set("n", "<leader>t", function()
	require("snacks").terminal()
end, { desc = "Open terminal" })

-- open keymaps reference
vim.keymap.set("n", "<leader>hk", function()
	local keymaps = vim.fn.stdpath("config") .. "/docs/KEYMAPS.md"
	vim.cmd("edit " .. keymaps)
end, { desc = "Open keymaps reference" })
