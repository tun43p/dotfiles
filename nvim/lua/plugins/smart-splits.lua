local M = {}

M.spec = { src = "https://github.com/mrjones2014/smart-splits.nvim" }

function M.config()
	local ss = require("smart-splits")

	ss.setup({
		ignored_filetypes = { "neo-tree" },
		multiplexer_integration = "zellij",
	})

	-- Navigation unifiée nvim <-> zellij via Alt+h/j/k/l et Alt+arrows
	vim.keymap.set("n", "<A-h>", ss.move_cursor_left, { desc = "Move to left split/pane" })
	vim.keymap.set("n", "<A-j>", ss.move_cursor_down, { desc = "Move to below split/pane" })
	vim.keymap.set("n", "<A-k>", ss.move_cursor_up, { desc = "Move to above split/pane" })
	vim.keymap.set("n", "<A-l>", ss.move_cursor_right, { desc = "Move to right split/pane" })
	vim.keymap.set("n", "<A-Left>", ss.move_cursor_left, { desc = "Move to left split/pane" })
	vim.keymap.set("n", "<A-Down>", ss.move_cursor_down, { desc = "Move to below split/pane" })
	vim.keymap.set("n", "<A-Up>", ss.move_cursor_up, { desc = "Move to above split/pane" })
	vim.keymap.set("n", "<A-Right>", ss.move_cursor_right, { desc = "Move to right split/pane" })
end

return M
