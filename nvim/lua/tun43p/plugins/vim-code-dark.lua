return {
	"tomasiser/vim-code-dark",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("set t_Co=256")
		vim.cmd("set t_ut=")
		vim.cmd("let g:codedark_modern=1")
		vim.cmd("let g:codedark_transparent=1")
		vim.cmd.colorscheme("codedark")
	end,
}
