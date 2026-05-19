return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{
			"<leader>ps",
			function()
				require("tun43p.cmds").pick_session()
			end,
			desc = "Pick session",
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
