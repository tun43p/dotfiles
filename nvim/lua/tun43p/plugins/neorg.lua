return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	init = function()
		local rocks = vim.fn.stdpath("data") .. "/lazy-rocks"
		vim.opt.rtp:prepend(rocks .. "/tree-sitter-norg/lib/lua/5.1")
		vim.opt.rtp:prepend(rocks .. "/tree-sitter-norg-meta/lib/lua/5.1")
	end,
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},

				["core.concealer"] = {
					config = {
						icon_preset = "diamond",
					},
				},

				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},

				["core.keybinds"] = {
					config = {
						default_keybinds = false,
					},
				},

				["core.integrations.treesitter"] = {},
			},
		})
	end,
	keys = {
		{ "<leader>ni", "<cmd>Neorg index<cr>", desc = "Neorg index" },
		{ "<leader>nr", "<cmd>Neorg return<cr>", desc = "Neorg return" },
		{ "<leader>nj", "<cmd>Neorg journal today<cr>", desc = "Neorg journal today" },
		{ "<leader>nw", "<cmd>Neorg workspace notes<cr>", desc = "Neorg workspace" },
	},
}
