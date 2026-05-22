local M = {}

M.spec = {
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
	},
	{
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	},
}

function M.config()
	-- Build fzf-native if needed (check for either .so or .dylib — Makefile may emit either on macOS)
	local fzf_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
	local built = vim.fn.filereadable(fzf_path .. "/build/libfzf.so") == 1
		or vim.fn.filereadable(fzf_path .. "/build/libfzf.dylib") == 1
	if vim.fn.isdirectory(fzf_path) == 1 and not built then
		vim.notify("Building telescope-fzf-native...", vim.log.levels.INFO)
		vim.fn.system({ "make", "-C", fzf_path })
	end

	local telescope = require("telescope")
	local actions = require("telescope.actions")

	telescope.setup({
		defaults = {
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = { preview_width = 0.55 },
				prompt_position = "top",
			},
			sorting_strategy = "ascending",
			mappings = {
				i = {
					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
					["<esc>"] = actions.close,
				},
			},
			file_ignore_patterns = { "%.git/", "node_modules/" },
		},
		pickers = {
			find_files = { hidden = true },
			live_grep = {
				additional_args = function()
					return { "--hidden" }
				end,
			},
		},
	})

	pcall(telescope.load_extension, "fzf")

	local map = vim.keymap.set
	map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
	map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
	map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
	map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
	map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
	map("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
	map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
	map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
	map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP symbols" })
	map({ "n", "x" }, "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Grep word under cursor" })
	map("n", "<leader>gl", "<cmd>Telescope git_commits<cr>", { desc = "Git log" })
	map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
	map("n", "<leader>gd", "<cmd>Telescope git_bcommits<cr>", { desc = "Git diff (buffer commits)" })

	map("n", "<C-r>", function()
		require("utils.pick_repo").pick_repo()
	end, { desc = "Pick repo" })

	-- Find and replace
	map("n", "<leader>fR", function()
		require("utils.find_and_replace").find_and_replace()
	end, { desc = "Find and replace" })
end

return M
