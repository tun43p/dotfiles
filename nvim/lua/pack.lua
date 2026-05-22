-- Native vim.pack bootstrap (Neovim 0.12+)
local M = {}

-- List of plugin modules to load (in order — colorscheme first, then UI, then LSP)
local plugin_modules = {
	"vesper",
	"_deps",
	"which-key",
	"neo-tree",
	"telescope",
	"noice",
	"smart-splits",
	"gitsigns",
	"gitlinker",
	"bufferline",
	"lualine",
	"mini",
	"treesitter",
	"flash",
	"blink",
	"lsp",
	"conform",
	"lint",
	"trouble",
	"todo-comments",
	"render-markdown",
	"image",
}

function M.setup()
	local specs = {}
	local configs = {}

	for _, name in ipairs(plugin_modules) do
		local mod = require("plugins." .. name)
		if mod.spec then
			if vim.islist(mod.spec) then
				for _, s in ipairs(mod.spec) do
					table.insert(specs, s)
				end
			else
				table.insert(specs, mod.spec)
			end
		end
		if mod.config then
			table.insert(configs, mod.config)
		end
	end

	if #specs > 0 then
		vim.pack.add(specs)
	end

	for _, config in ipairs(configs) do
		local ok, err = pcall(config)
		if not ok then
			vim.notify("Plugin config error: " .. tostring(err), vim.log.levels.ERROR)
		end
	end

	-- Rebuild configs when plugins are updated
	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function()
			vim.notify("Plugins updated, restart required", vim.log.levels.INFO)
		end,
	})
end

return M
