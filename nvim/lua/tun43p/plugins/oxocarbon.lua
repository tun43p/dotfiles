return {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.background = "dark"
		vim.cmd.colorscheme("oxocarbon")

		local transparent_groups = {
			"Normal",
			"NormalNC",
			"NormalFloat",
			"FloatBorder",
			"SignColumn",
			"EndOfBuffer",
			"LineNr",
			"CursorLineNr",
			"StatusLine",
			"StatusLineNC",
			"VertSplit",
			"WinSeparator",
			"TabLine",
			"TabLineFill",
		}
		for _, group in ipairs(transparent_groups) do
			vim.api.nvim_set_hl(0, group, { bg = "none" })
		end

		-- Override snacks highlights after plugins load (snacks sets them with default=true)
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			once = true,
			callback = function()
				-- base13 = #42be65 (green) — untracked files, visible on dark bg
				vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#42be65" })
			end,
		})
	end,
}
