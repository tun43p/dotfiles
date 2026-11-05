local M = {}

M.spec = { src = "https://github.com/nvim-lualine/lualine.nvim" }

-- ANSI indexes -> terminal palette. ponytail: 0-7 only, tmux (tpipeline) rejects fg=8-15
local function mode(bg)
	return { a = { fg = 0, bg = bg, gui = "bold" }, b = { fg = 7, bg = 0 }, c = { fg = 7, bg = "NONE" } }
end
local theme = {
	normal = mode(4),
	insert = mode(2),
	visual = mode(5),
	replace = mode(1),
	command = mode(3),
	inactive = mode(0),
}

function M.config()
	require("lualine").setup({
		options = {
			theme = theme,
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
	})
end

return M
