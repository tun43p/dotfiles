return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- Gros fichiers : desactive les features lourdes
		bigfile = { enabled = true },

		-- Rendu rapide quand on ouvre un fichier depuis le shell
		quickfile = { enabled = true },

		-- Explorateur de fichiers (remplace neo-tree)
		explorer = { enabled = true },

		-- Picker (remplace telescope)
		picker = { enabled = true },

		-- Notifications (remplace noice + nvim-notify)
		notifier = { enabled = true },

		-- Meilleur vim.ui.input (remplace noice pour les inputs)
		input = { enabled = true },

		-- Terminal (utilise par claudecode.nvim)
		terminal = {},

		-- Guides d'indentation
		indent = { enabled = true },

		-- Detection de scope (treesitter/indent)
		scope = { enabled = true },

		-- Navigation rapide entre les references LSP
		words = { enabled = true },

		-- Suppression de buffers sans casser le layout
		bufdelete = {},

		-- Ouvrir fichier/branche/commit dans le navigateur
		gitbrowse = {},

		-- Utilitaires git
		git = {},

		-- Smooth scrolling
		scroll = { enabled = true },

		-- Status column
		statuscolumn = { enabled = true },

		-- Toggle keymaps integres avec which-key
		toggle = {},

		-- Dim les scopes inactifs
		dim = {},

		-- Zen mode
		zen = {},
	},
	keys = {
		-- Picker : fichiers (memes raccourcis que telescope)
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
		{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Live grep" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fh", function() Snacks.picker.help() end, desc = "Help tags" },

		-- Picker : extras
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },
		{ "<leader>fc", function() Snacks.picker.commands() end, desc = "Commands" },
		{ "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
		{ "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word under cursor", mode = { "n", "x" } },

		-- Explorateur de fichiers (remplace neo-tree)
		{ "<leader>e", function() Snacks.explorer() end, desc = "File explorer" },

		-- Git
		{ "<leader>gb", function() Snacks.gitbrowse() end, desc = "Open in browser", mode = { "n", "v" } },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff" },

		-- Buffers
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
		{ "<leader>ba", function() Snacks.bufdelete.all() end, desc = "Delete all buffers" },
		{ "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete other buffers" },

		-- Notifications
		{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification history" },
		{ "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss notifications" },

		-- Zen mode
		{ "<leader>z", function() Snacks.zen() end, desc = "Zen mode" },

		-- Words (navigation references LSP)
		{ "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next reference", mode = { "n", "t" } },
		{ "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Previous reference", mode = { "n", "t" } },
	},
}
