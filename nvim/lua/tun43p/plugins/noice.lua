return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
		},
		messages = {
			enabled = false,
		},
		popupmenu = {
			enabled = true,
		},
		notify = {
			enabled = false,
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			-- skip "written" messages
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
		views = {
			cmdline_popup = {
				position = {
					row = "50%",
					col = "50%",
				},
				size = {
					width = 60,
					min_height = 1,
				},
			},
		},
	},
}
