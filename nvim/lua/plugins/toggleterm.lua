local M = {}

M.spec = { src = "https://github.com/akinsho/toggleterm.nvim" }

function M.config()
	require("toggleterm").setup({
		size = 15,
		shade_terminals = true,
		start_in_insert = true,
		insert_mappings = false,
		terminal_mappings = true,
		persist_size = true,
		direction = "float",
		float_opts = { border = "rounded" },
	})

	vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
	vim.keymap.set("t", "<Esc>", "<cmd>ToggleTerm<cr>", { desc = "Close terminal" })
	vim.keymap.set(
		"n",
		"<leader>st",
		"<cmd>ToggleTerm direction=horizontal size=15<cr>",
		{ desc = "Terminal split (bottom)" }
	)

	vim.keymap.set("n", "<leader>gg", function()
		require("utils.open_lazygit").open_lazygit()
	end, { desc = "Lazygit" })
end

return M
