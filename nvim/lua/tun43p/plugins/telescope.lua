return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")

		vim.keymap.set(
			"n",
			"<leader>ff",
			builtin.find_files,
			{ desc = "Lists files in your current working directory, respects .gitignore" }
		)
		vim.keymap.set(
			"n",
			"<leader>fg",
			builtin.live_grep,
			{ desc = "Fuzzy search through the output of git ls-files command, respects .gitignore" }
		)
		vim.keymap.set(
			"n",
			"<leader>fb",
			builtin.buffers,
			{ desc = "Searches for the string under your cursor or selection in your current working directory" }
		)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
			desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep)",
		})
	end,
}
