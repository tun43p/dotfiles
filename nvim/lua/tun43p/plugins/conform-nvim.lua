return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufWritePre",
		-- "BufEnter"
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				html = { "htmlbeautfier" },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				python = { "black" },
				lua = { "stylua" },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
			},
			format_on_save = {
				timeout = 500,
				lsp_format = "falback",
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf })
			end,
		})

		-- vim.keymap.set({ "n", "v" }, "<leader>w", function()
		--   conform.format({
		--     lsp_fallback = true,
		--     async = false,
		--     timeout = 5000,
		--   })
		-- end, { desc = "Format file or range (in visual mode)" })
	end,
}
