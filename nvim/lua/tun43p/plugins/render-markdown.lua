return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown", "norg" },
	opts = {
		render_modes = true,
		sign = { enabled = false },
		heading = {
			sign = false,
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
		},
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		bullet = {
			icons = { "●", "○", "◆", "◇" },
		},
	},
	keys = {
		{
			"<leader>mr",
			"<cmd>RenderMarkdown toggle<cr>",
			desc = "Toggle markdown render",
			ft = { "markdown", "norg" },
		},
	},
}
