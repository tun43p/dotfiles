return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufWritePre",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			html = { "htmlhint" },
			css = { "stylelint" },
			scss = { "stylelint" },
			python = { "pylint" },
			lua = { "luacheck" },
			yaml = { "yamllint" },
			json = { "jsonlint" },
			markdown = { "markdownlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- vim.keymap.set("n", "<leader>ll", function()
		-- 	lint.try_lint()
		-- end, { desc = "Trigger linting for current file" })
	end,
}
