local M = {}

M.spec = { src = "https://github.com/folke/trouble.nvim" }

function M.config()
	require("trouble").setup({
		focus = true,
	})

	vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
	vim.keymap.set(
		"n",
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		{ desc = "Buffer Diagnostics (Trouble)" }
	)
	vim.keymap.set(
		"n",
		"<leader>xs",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		{ desc = "Symbols (Trouble)" }
	)
	vim.keymap.set(
		"n",
		"<leader>xl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		{ desc = "LSP refs/defs (Trouble)" }
	)
	vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location list (Trouble)" })
	vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix list (Trouble)" })
end

return M
