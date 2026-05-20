local M = {}

M.spec = {
	src = "https://github.com/folke/which-key.nvim",
}

function M.config()
	vim.o.timeout = true
	vim.o.timeoutlen = 300
	require("which-key").setup({})
end

return M
