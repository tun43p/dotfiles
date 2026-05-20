local M = {}

M.spec = {
	{ src = "https://github.com/echasnovski/mini.pairs" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/echasnovski/mini.bufremove" },
	{ src = "https://github.com/echasnovski/mini.indentscope" },
	{ src = "https://github.com/echasnovski/mini.cursorword" },
}

function M.config()
	-- pairs
	require("mini.pairs").setup({
		modes = { insert = true, command = false, terminal = false },
		mappings = {
			["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
			["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
			["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
			[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
			["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
			["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
			['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
			["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
			["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
		},
	})

	-- surround
	require("mini.surround").setup({
		mappings = {
			add = "sa",
			delete = "sd",
			replace = "sr",
			find = "sf",
			find_left = "sF",
			highlight = "sh",
			update_n_lines = "sn",
		},
	})

	-- bufremove
	require("mini.bufremove").setup({})
	vim.keymap.set("n", "<leader>qb", function()
		require("mini.bufremove").delete(0, false)
	end, { desc = "Quit buffer" })
	vim.keymap.set("n", "<leader>qo", function()
		local cur = vim.api.nvim_get_current_buf()
		for _, b in ipairs(vim.api.nvim_list_bufs()) do
			if b ~= cur and vim.api.nvim_buf_is_loaded(b) then
				pcall(require("mini.bufremove").delete, b, false)
			end
		end
	end, { desc = "Quit other buffers" })

	-- indentscope (animation disabled, disabled on certain filetypes)
	require("mini.indentscope").setup({
		symbol = "│",
		options = { try_as_border = true },
		draw = { animation = function() return 0 end },
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "help", "neo-tree", "Trouble", "mason", "notify", "toggleterm", "TelescopePrompt" },
		callback = function() vim.b.miniindentscope_disable = true end,
	})

	-- cursorword
	require("mini.cursorword").setup({ delay = 100 })
end

return M
