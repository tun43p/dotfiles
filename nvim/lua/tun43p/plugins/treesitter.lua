return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local parsers = {
			"astro", "bash", "c", "cmake", "cpp", "css", "dockerfile",
			"go", "gomod", "graphql", "html", "javascript", "json",
			"kotlin", "latex", "lua", "markdown", "markdown_inline",
			"prisma", "python", "regex", "rust", "scss", "svelte",
			"toml", "tsx", "typescript", "typst", "vim", "vimdoc",
			"vue", "yaml", "zig",
		}

		-- Install missing parsers on startup
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyDone",
			once = true,
			callback = function()
				local installed = {}
				for _, p in ipairs(require("nvim-treesitter").get_installed()) do
					installed[p] = true
				end
				local missing = vim.tbl_filter(function(p)
					return not installed[p]
				end, parsers)
				if #missing > 0 then
					require("nvim-treesitter").install(missing)
				end
			end,
		})

		-- Folding via treesitter (disabled by default)
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldenable = false
	end,
}
