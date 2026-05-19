-- save the file with space + s
vim.keymap.set("n", "<leader>w", ":write<cr>", { silent = true, desc = "Save file" })

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

-- close current split with <leader>sq
vim.keymap.set("n", "<leader>sq", "<c-w>q", { desc = "Close split" })

-- quit the current buffer with shift + q
vim.keymap.set("n", "<leader>q", "<c-w>q", { desc = "Kill window" })

-- open split with <leader>sh or <leader>sv
vim.keymap.set("n", "<leader>sh", "<c-w>s", { desc = "Open horizontal split" })
vim.keymap.set("n", "<leader>sv", "<c-w>v", { desc = "Open vertical split" })

-- jump between splits with <leader> + vim keys or vim keys
vim.keymap.set("n", "<leader>h", "<c-w>h", { desc = "Jump to left split" })
vim.keymap.set("n", "<leader>j", "<c-w>j", { desc = "Jump to bottom split" })
vim.keymap.set("n", "<leader>k", "<c-w>k", { desc = "Jump to upper split" })
vim.keymap.set("n", "<leader>l", "<c-w>l", { desc = "Jump to right split" })

-- jump between splits with <leader> + arrow keys or vim keys
vim.keymap.set("n", "<leader><Left>", "<c-w>h", { desc = "Jump to left split" })
vim.keymap.set("n", "<leader><Down>", "<c-w>j", { desc = "Jump to bottom split" })
vim.keymap.set("n", "<leader><Up>", "<c-w>k", { desc = "Jump to upper split" })
vim.keymap.set("n", "<leader><Right>", "<c-w>l", { desc = "Jump to right split" })

-- jump between splits with <leader> + vim keys or <C>
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

-- floating terminal toggle with <leader>t
vim.keymap.set("n", "<leader>t", function()
	Snacks.terminal.toggle()
end, { desc = "Toggle floating terminal" })

-- split terminal at the bottom with <leader>st
vim.keymap.set("n", "<leader>st", function()
	Snacks.terminal(nil, { win = { position = "bottom" } })
end, { desc = "Open terminal split (bottom)" })

-- open keymaps reference in a floating window
vim.keymap.set("n", "<leader>hk", function()
	local keymaps = vim.fn.stdpath("config") .. "/docs/KEYMAPS.md"
	Snacks.win({
		file = keymaps,
		position = "float",
		width = 0.8,
		height = 0.8,
		border = "rounded",
		title = " Keymaps ",
		title_pos = "center",
		wo = { wrap = false },
	})
end, { desc = "Open keymaps reference" })

-- reload neovim config
vim.keymap.set("n", "<leader>rc", function()
	vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
	vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload config" })
