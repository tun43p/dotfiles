return {
	"sudo-tee/opencode.nvim",
	config = function()
		require("opencode").setup({
			ui = {
				icons = {
					preset = "emoji",
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"saghen/blink.cmp",
		"folke/snacks.nvim",
	},
}
