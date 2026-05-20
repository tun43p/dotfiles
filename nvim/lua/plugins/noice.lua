local M = {}

M.spec = {
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/rcarriga/nvim-notify" },
}

function M.config()
	require("notify").setup({
		background_colour = "#000000",
		render = "default",
		stages = "fade",
		timeout = 3000,
	})

	require("noice").setup({
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = { icon = ">" },
				search_down = { icon = " " },
				search_up = { icon = " " },
				filter = { icon = "$" },
				lua = { icon = "" },
				help = { icon = "?" },
			},
		},
		messages = { enabled = true },
		popupmenu = { enabled = true, backend = "nui" },
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
			hover = { enabled = true },
			signature = { enabled = true },
		},
		presets = {
			bottom_search = false,
			command_palette = true,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
		notify = { enabled = true },
		views = {
			cmdline_popup = {
				position = { row = "40%", col = "50%" },
				size = { width = 60, height = "auto" },
				border = { style = "rounded" },
			},
		},
	})

	vim.keymap.set("n", "<leader>nh", function() require("noice").cmd("history") end, { desc = "Notification history" })
	vim.keymap.set("n", "<leader>nd", function() require("noice").cmd("dismiss") end, { desc = "Dismiss notifications" })
end

return M
