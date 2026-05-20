local M = {}

M.spec = { src = "https://github.com/akinsho/toggleterm.nvim" }

function M.config()
	require("toggleterm").setup({
		size = 15,
		shade_terminals = true,
		start_in_insert = true,
		insert_mappings = false,
		terminal_mappings = true,
		persist_size = true,
		direction = "float",
		float_opts = { border = "rounded" },
	})

	vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })
	vim.keymap.set("n", "<leader>st", "<cmd>ToggleTerm direction=horizontal size=15<cr>", { desc = "Terminal split (bottom)" })

	vim.keymap.set("n", "<leader>gg", function()
		local Terminal = require("toggleterm.terminal").Terminal
		local file = vim.api.nvim_buf_get_name(0)
		local dir = (file ~= "" and vim.fn.filereadable(file) == 1)
			and vim.fn.fnamemodify(file, ":p:h")
			or vim.uv.cwd()
		local root = vim.fs.root(dir, ".git") or dir
		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = root,
			direction = "float",
			float_opts = { border = "rounded" },
			hidden = true,
		})
		lazygit:toggle()
	end, { desc = "Lazygit" })
end

return M
