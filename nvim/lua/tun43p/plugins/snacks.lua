return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- Big files: disable heavy features
		bigfile = { enabled = true },

		-- Startup screen
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.picker.files()" },
					{ icon = " ", key = "n", desc = "New file", action = ":ene | startinsert" },
					{ icon = " ", key = "g", desc = "Find text", action = ":lua Snacks.picker.grep()" },
					{ icon = " ", key = "r", desc = "Recent files", action = ":lua Snacks.picker.recent()" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
					},
					{
						icon = "󰒲 ",
						key = "l",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ section = "startup" },
			},
		},

		-- Fast rendering when opening a file from the shell
		quickfile = { enabled = true },

		-- File explorer (replaces neo-tree)
		explorer = { enabled = true },

		-- Picker (replaces telescope)
		picker = {
			enabled = true,
			sources = {
				explorer = {
					hidden = true,
					ignored = true,
				},
			},
		},

		-- Notifications (replaces noice + nvim-notify)
		notifier = { enabled = true },

		-- vim.ui.input replacement
		input = { enabled = true },

		-- Terminal (used by claudecode.nvim)
		terminal = {},

		-- Indent guides
		indent = { enabled = true },

		-- Scope detection (treesitter/indent)
		scope = { enabled = true },

		-- Navigation quick between LSP references
		words = { enabled = true },

		-- Buffer deletion without breaking layout
		bufdelete = {},

		-- Open file/branch/commit in browser
		gitbrowse = {},

		-- Git utilities
		git = {},

		-- Inline image rendering (Ghostty supported)
		image = { enabled = true },

		-- Smooth scrolling
		scroll = { enabled = true },

		-- Status column
		statuscolumn = { enabled = true },

		-- Toggle keymaps integrated with which-key
		toggle = {},

		-- Dim inactive scopes
		dim = {},

		-- Zen mode
		zen = {},
	},
	keys = {
		-- Picker : files
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help tags",
		},

		-- Picker : extras
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent files",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP symbols",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep word under cursor",
			mode = { "n", "x" },
		},

		-- File explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File explorer",
		},

		-- Git
		{
			"<leader>gb",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Open in browser",
			mode = { "n", "v" },
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git log",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git status",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git diff",
		},

		-- Buffers
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete buffer",
		},
		{
			"<leader>ba",
			function()
				Snacks.bufdelete.all()
			end,
			desc = "Delete all buffers",
		},
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete other buffers",
		},

		-- Notifications
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification history",
		},
		{
			"<leader>nd",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss notifications",
		},

		-- Zen mode
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Zen mode",
		},

		-- Words (reference navigation LSP)
		{
			"]]",
			function()
				Snacks.words.jump(vim.v.count1)
			end,
			desc = "Next reference",
			mode = { "n", "t" },
		},
		{
			"[[",
			function()
				Snacks.words.jump(-vim.v.count1)
			end,
			desc = "Previous reference",
			mode = { "n", "t" },
		},
	},
}
