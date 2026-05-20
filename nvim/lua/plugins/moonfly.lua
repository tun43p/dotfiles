local M = {}

M.spec = {
	src = "https://github.com/bluz71/vim-moonfly-colors",
	name = "moonfly",
}

function M.config()
	vim.g.moonflyTransparent = true
	vim.cmd.colorscheme("moonfly")
end

return M

