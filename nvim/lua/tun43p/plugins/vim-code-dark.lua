-- NOTE: vim-code-dark replaced by tokyonight
-- return {
-- 	"tomasiser/vim-code-dark",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("set t_Co=256")
-- 		vim.cmd("set t_ut=")
-- 		vim.cmd("let g:codedark_modern=1")
-- 		vim.cmd("let g:codedark_transparent=1")
-- 		vim.cmd.colorscheme("codedark")
-- 	end,
-- }

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		style = "night",
		transparent = true,
		terminal_colors = true,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			sidebars = "transparent",
			floats = "transparent",
		},
		on_highlights = function(hl, c)
			-- Better visibility for snacks picker
			hl.SnacksPickerMatch = { fg = c.blue, bold = true }
		end,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
