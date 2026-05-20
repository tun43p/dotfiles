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

-- quit all
vim.keymap.set("n", "<leader>qa", "<cmd>qa<cr>", { silent = true, desc = "Quit all" })

-- quit window
vim.keymap.set("n", "<leader>qq", "<c-w>q", { silent = true, desc = "Quit window" })

-- quit split
vim.keymap.set("n", "<leader>qs", "<c-w>q", { silent = true, desc = "Quit split" })

-- Note: <leader>qb and <leader>qo are defined in plugins/mini.lua (mini.bufremove)

-- open split with <leader>wh or <leader>wv
vim.keymap.set("n", "<leader>wh", "<c-w>s", { desc = "Open horizontal split" })
vim.keymap.set("n", "<leader>wv", "<c-w>v", { desc = "Open vertical split" })

-- jump between splits with <leader> + arrow keys
vim.keymap.set("n", "<leader><Left>", "<c-w>h", { desc = "Jump to left split" })
vim.keymap.set("n", "<leader><Down>", "<c-w>j", { desc = "Jump to bottom split" })
vim.keymap.set("n", "<leader><Up>", "<c-w>k", { desc = "Jump to upper split" })
vim.keymap.set("n", "<leader><Right>", "<c-w>l", { desc = "Jump to right split" })

-- jump between splits with <leader> + vim keys or <C>
vim.keymap.set("n", "<C-h>", "<c-w>h", { desc = "Jump to left split" })
vim.keymap.set("n", "<C-j>", "<c-w>j", { desc = "Jump to bottom split" })
vim.keymap.set("n", "<C-k>", "<c-w>k", { desc = "Jump to upper split" })
vim.keymap.set("n", "<C-l>", "<c-w>l", { desc = "Jump to right split" })

-- navigate between buffers in visual order with tab (bufferline)
vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { silent = true, desc = "Navigate to next buffer" })
vim.keymap.set("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", { silent = true, desc = "Navigate to previous buffer" })

--  navigate between buffers in visual order with ctrl keys (bufferline)
vim.keymap.set("n", "<C-n>", "<cmd>BufferLineCycleNext<cr>", { silent = true, desc = "Navigate to next buffer" })
vim.keymap.set("n", "<C-p>", "<cmd>BufferLineCyclePrev<cr>", { silent = true, desc = "Navigate to previous buffer" })

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

-- reload neovim config
vim.keymap.set("n", "<leader>rc", function()
	vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
	vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload config" })
