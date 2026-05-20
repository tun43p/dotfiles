local function open_lazygit()
	local Terminal = require("toggleterm.terminal").Terminal
	local file = vim.api.nvim_buf_get_name(0)
	local dir = (file ~= "" and vim.fn.filereadable(file) == 1) and vim.fn.fnamemodify(file, ":p:h") or vim.uv.cwd()
	local root = vim.fs.root(dir, ".git") or dir
	local lazygit = Terminal:new({
		cmd = "lazygit",
		dir = root,
		direction = "float",
		float_opts = { border = "rounded" },
		hidden = true,
	})
	lazygit:toggle()
end

return { open_lazygit = open_lazygit }
