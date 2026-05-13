return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufWritePre" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				astro = { "prettierd", "prettier", stop_after_first = true },
				c = { "clang-format" },
				cmake = { "cmake-format" },
				cpp = { "clang-format" },
				css = { "prettierd", "prettier", stop_after_first = true },
				go = { "gofumpt" },
				html = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				kotlin = { "ktlint" },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				python = { "ruff" },
				scss = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})
	end,
}
