local M = {}

M.spec = { src = "https://github.com/christoomey/vim-tmux-navigator" }

function M.config()
	vim.keymap.set("n", "<A-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move to left split/pane" })
	vim.keymap.set("n", "<A-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move to below split/pane" })
	vim.keymap.set("n", "<A-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move to above split/pane" })
	vim.keymap.set("n", "<A-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move to right split/pane" })
	vim.keymap.set("n", "<A-Left>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move to left split/pane" })
	vim.keymap.set("n", "<A-Down>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move to below split/pane" })
	vim.keymap.set("n", "<A-Up>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move to above split/pane" })
	vim.keymap.set("n", "<A-Right>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move to right split/pane" })
end

return M
