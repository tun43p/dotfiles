local M = {}

M.spec = {
	src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
	version = "v3.x",
}

function M.config()
	require("neo-tree").setup({
		sources = { "filesystem", "buffers", "git_status" },
		source_selector = {
			winbar = true,
			sources = {
				{ source = "filesystem", display_name = " Files" },
				{ source = "buffers", display_name = " Buffers" },
				{ source = "git_status", display_name = " Git" },
			},
		},
		filesystem = {
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
		window = { position = "left", width = 35 },
		default_component_configs = { indent = { with_markers = true } },
	})
	vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File explorer" })
end

return M
