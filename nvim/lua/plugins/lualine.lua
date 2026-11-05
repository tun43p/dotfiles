local M = {}

M.spec = { src = "https://github.com/nvim-lualine/lualine.nvim" }

-- ANSI indexes -> terminal palette, rebuilt when 'background' flips (light/dark).
-- 0-7 only: vim-tpipeline forwards cterm colors to tmux, which rejects fg=8-15.
-- Mode blocks: light text (7) on dark hues (blue/magenta/red), dark text (0) on light hues (green/yellow).
local function theme()
	local text = { fg = vim.o.background == "dark" and 7 or 0, bg = "NONE" }
	local function mode(bg, fg)
		return { a = { fg = fg, bg = bg, gui = "bold" }, b = text, c = text }
	end
	return {
		normal = mode(4, 7),
		insert = mode(2, 0),
		visual = mode(5, 7),
		replace = mode(1, 7),
		command = mode(3, 0),
		inactive = { a = text, b = text, c = text },
	}
end

function M.config()
	local opts = {
		options = {
			theme = theme(),
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			globalstatus = vim.env.TMUX == nil,
			disabled_filetypes = {},
			ignore_focus = { "*" },
		},
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(str)
						return str:sub(1, 3)
					end,
				},
			},
			lualine_b = {
				{ "branch", icon = "" },
				{
					"diff",
					symbols = { added = " ", modified = " ", removed = " " },
				},
			},
			lualine_c = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
				},
				{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				{
					"filename",
					path = 1,
					symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
				},
			},
			lualine_x = {
				{
					function()
						local clients = vim.lsp.get_clients({ bufnr = 0 })
						if #clients == 0 then
							return ""
						end
						local names = {}
						for _, client in ipairs(clients) do
							table.insert(names, client.name)
						end
						return " " .. table.concat(names, ", ")
					end,
				},
			},
			lualine_y = {
				{ "encoding", padding = { left = 1, right = 0 } },
				{ "fileformat", padding = { left = 1, right = 1 } },
			},
			lualine_z = {
				{ "progress" },
				{ "location" },
			},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{ "filename", path = 1 },
			},
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
	}
	require("lualine").setup(opts)

	local bg = vim.o.background
	vim.api.nvim_create_autocmd("OptionSet", {
		pattern = "background",
		callback = function()
			if vim.o.background ~= bg then
				bg = vim.o.background
				opts.options.theme = theme()
				require("lualine").setup(opts)
			end
		end,
	})
end

return M
