return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{
			"<leader>ps",
			function()
				require("persistence").load()
			end,
			desc = "Restore session",
		},
		{
			"<leader>pl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore last session",
		},
		{
			"<leader>pd",
			function()
				require("persistence").stop()
			end,
			desc = "Stop session persistence",
		},
	},
}
