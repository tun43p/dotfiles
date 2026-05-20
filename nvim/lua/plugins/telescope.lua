local M = {}

M.spec = {
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = "0.1.x",
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
			live_grep = { additional_args = function() return { "--hidden" } end },
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
	map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP symbols" })
	map({ "n", "x" }, "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Grep word under cursor" })
	map("n", "<leader>gl", "<cmd>Telescope git_commits<cr>", { desc = "Git log" })
	map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
	map("n", "<leader>gd", "<cmd>Telescope git_bcommits<cr>", { desc = "Git diff (buffer commits)" })

	-- Find and replace
	map("n", "<leader>fR", function()
		local search = vim.fn.input("Search: ")
		if search == "" then return end
		local replace = vim.fn.input("Replace: ")
		if replace == "" then
			local confirm = vim.fn.confirm("Replace with empty string?", "&Yes\n&No", 2)
			if confirm ~= 1 then return end
		end
		local builtin = require("telescope.builtin")
		local action_state = require("telescope.actions.state")
		builtin.live_grep({
			default_text = search,
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					local picker = action_state.get_current_picker(prompt_bufnr)
					local multi = picker:get_multi_selection()
					local items = #multi > 0 and multi or { action_state.get_selected_entry() }
					actions.close(prompt_bufnr)
					local qf_items = {}
					for _, item in ipairs(items) do
						table.insert(qf_items, {
							filename = item.filename or item.path,
							lnum = item.lnum or 1,
							col = item.col or 0,
							text = item.text or "",
						})
					end
					vim.fn.setqflist({}, "r", { items = qf_items })
					local esc_s = vim.fn.escape(search, "/\\.[]^$*~&")
					local esc_r = vim.fn.escape(replace, "/\\&~")
					local ok, err = pcall(vim.cmd, "cfdo s/" .. esc_s .. "/" .. esc_r .. "/g | update")
					if not ok then
						vim.notify("Find and replace failed: " .. tostring(err), vim.log.levels.ERROR)
					end
				end)
				return true
			end,
		})
	end, { desc = "Find and replace" })
end

return M
