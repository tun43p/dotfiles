return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = true,
		float = {
			transparent = true,
		},
		integrations = {
			bufferline = true,
			gitsigns = true,
			snacks = { enabled = true },
			treesitter = true,
			render_markdown = true,
			which_key = true,
			blink_cmp = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
		},
		highlight_overrides = {
			mocha = function()
				return {
					SnacksNormal = { bg = "NONE" },
					SnacksNormalNC = { bg = "NONE" },
					SnacksDashboardNormal = { bg = "NONE" },
					SnacksPickerList = { bg = "NONE" },
					SnacksPickerInput = { bg = "NONE" },
					SnacksLayoutBox = { bg = "NONE" },
				}
			end,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
