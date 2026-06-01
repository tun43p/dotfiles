local M = {}

M.spec = { src = "https://github.com/mfussenegger/nvim-lint" }

function M.config()
	local lint = require("lint")

	lint.linters_by_ft = {
		astro = { "eslint_d" },
		c = { "cpplint" },
		cmake = { "cmakelint" },
		cpp = { "cpplint" },
		css = { "eslint_d" },
		go = { "golangcilint" },
		html = { "htmlhint" },
		-- json linting handled by jsonls LSP
		javascript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		kotlin = { "ktlint" },
		-- lua = { "luacheck" },
		markdown = { "markdownlint" },
		-- python linting handled by ruff LSP
		scss = { "eslint_d" },
		svelte = { "eslint_d" },
		typescript = { "eslint_d" },
		typescriptreact = { "eslint_d" },
		-- yaml linting handled by yamlls LSP
	}

	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
		group = lint_augroup,
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
