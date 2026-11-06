local M = {}

M.spec = { src = "https://github.com/jeffkreeftmeijer/vim-dim" }

function M.config()
	-- dim targets Vim, where String links to Constant and Function to Identifier.
	-- Neovim >= 0.10 gives them their own colors (String would match Type), so
	-- restore Vim's links on every load (dim reloads when 'background' flips).
	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "dim",
		callback = function()
			vim.api.nvim_set_hl(0, "String", { link = "Constant" })
			vim.api.nvim_set_hl(0, "Function", { link = "Identifier" })
		end,
	})
	vim.cmd.colorscheme("dim")
end

return M
