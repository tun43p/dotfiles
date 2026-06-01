local M = {}

M.spec = {
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
}

function M.config()
	require("mason-tool-installer").setup({
		ensure_installed = {
			-- Formatters
			"prettierd",
			"stylua",
			"clang-format",
			"cmakelang",
			"gofumpt",
			"ktlint",
			"ruff",

			-- Linters
			"eslint_d",
			"cpplint",
			"cmakelint",
			"golangci-lint",
			"htmlhint",
			"markdownlint",
		},
		auto_update = false,
		run_on_start = true,
	})

	require("conform").setup({
		formatters_by_ft = {
			astro = { "prettierd" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			css = { "prettierd" },
			go = { "gofumpt" },
			html = { "prettierd" },
			json = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			kotlin = { "ktlint" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
			scss = { "prettierd" },
			svelte = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			yaml = { "prettierd" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end

return M
