return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local parsers = {
			"astro",
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"dockerfile",
			"go",
			"gomod",
			"graphql",
			"html",
			"javascript",
			"json",
			"kotlin",
			"lua",
			"markdown",
			"markdown_inline",
			"prisma",
			"python",
			"regex",
			"rust",
			"scss",
			"svelte",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
			"zig",
		}

		-- Auto-install missing parsers without blocking startup
		vim.api.nvim_create_autocmd("VimEnter", {
			once = true,
			callback = function()
				vim.defer_fn(function()
					local install = require("nvim-treesitter.install")
					for _, lang in ipairs(parsers) do
						local ok = pcall(vim.treesitter.language.inspect, lang)
						if not ok then
							install.install(lang)
						end
					end
				end, 500)
			end,
		})

		-- Enable treesitter highlight + indent on each buffer
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)
			end,
		})

		-- Folding via treesitter (disabled by default)
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldenable = false
	end,
}
