return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufWritePre",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			astro = { "eslint_d" },
			c = { "cpplint" },
			cmake = { "cmakelint" },
			cpp = { "cpplint" },
			css = { "eslint_d" },
			go = { "golangci-lint" },
			html = { "htmlhint" },
			json = { "jsonlint" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			kotlin = { "ktlint" },
			-- lua = { "luacheck" },
			markdown = { "markdownlint" },
			python = { "ruff" },
			scss = { "eslint_d" },
			svelte = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			yaml = { "yamllint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
