local M = {}

M.spec = {
	src = "https://github.com/datsfilipe/vesper.nvim",
	name = "vesper",
}

function M.config()
	require("vesper").setup({
		transparent = true,

		italics = {
			comments = true,
			keywords = true,
			functions = true,
			strings = true,
			variables = true,
		},

		overrides = {},
		palette_overrides = {},
	})

	vim.cmd.colorscheme("vesper")
end

return M
