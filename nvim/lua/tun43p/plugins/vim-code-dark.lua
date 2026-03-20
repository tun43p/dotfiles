return {
	"Mofiqul/vscode.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		italic_comments = true,
	},
	config = function(_, opts)
		require("vscode").setup(opts)
		vim.cmd.colorscheme("vscode")
	end,
}
