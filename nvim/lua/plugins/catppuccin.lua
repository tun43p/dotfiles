local M = {}

M.spec = {
	src = "https://github.com/catppuccin/nvim",
	name = "catppuccin",
}

function M.config()
	require("catppuccin").setup({
		flavour = "mocha",
		transparent_background = true,
		float = { transparent = true },
		integrations = {
			blink_cmp = true,
			bufferline = true,
			gitsigns = true,
			treesitter = true,
			render_markdown = true,
			neotree = true,
			noice = true,
			notify = true,
			telescope = { enabled = true },
			mini = { enabled = true },
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
		custom_highlights = function()
			return {
				NeoTreeNormal = { bg = "NONE" },
				NeoTreeNormalNC = { bg = "NONE" },
				NoiceCmdlinePopup = { bg = "NONE" },
				NoiceCmdlinePopupBorder = { bg = "NONE" },
				NotifyBackground = { bg = "NONE" },
			}
		end,
	})
	vim.cmd.colorscheme("catppuccin-mocha")
end

return M
