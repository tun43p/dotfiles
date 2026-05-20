local M = {}

M.spec = { src = "https://github.com/nvim-treesitter/nvim-treesitter" }

function M.config()
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
		"latex",
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
		"typst",
		"vim",
		"vimdoc",
		"vue",
		"yaml",
		"zig",
	}

	-- Install missing parsers asynchronously after Neovim has fully started
	vim.api.nvim_create_autocmd("VimEnter", {
		once = true,
		callback = function()
			vim.schedule(function()
				local ok_ts, ts = pcall(require, "nvim-treesitter")
				if not ok_ts or not ts.get_installed then
					return
				end
				local installed = {}
				for _, p in ipairs(ts.get_installed()) do
					installed[p] = true
				end
				local missing = vim.tbl_filter(function(p)
					return not installed[p]
				end, parsers)
				if #missing > 0 then
					ts.install(missing)
				end
			end)
		end,
	})

	-- Folding via treesitter (disabled by default)
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.opt.foldenable = false
end

return M
