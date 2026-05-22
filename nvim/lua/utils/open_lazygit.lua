local function open_lazygit()
	local file = vim.api.nvim_buf_get_name(0)
	local dir = (file ~= "" and vim.fn.filereadable(file) == 1) and vim.fn.fnamemodify(file, ":p:h") or vim.uv.cwd()
	local root = vim.fs.root(dir, ".git") or dir

	if vim.env.ZELLIJ then
		vim.fn.jobstart({
			"zellij",
			"run",
			"--floating",
			"--close-on-exit",
			"--cwd",
			root,
			"--",
			"lazygit",
		}, { detach = true })
	else
		local buf = vim.api.nvim_create_buf(false, true)
		local width = math.floor(vim.o.columns * 0.9)
		local height = math.floor(vim.o.lines * 0.9)
		local win = vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = math.floor((vim.o.lines - height) / 2),
			col = math.floor((vim.o.columns - width) / 2),
			border = "rounded",
		})
		vim.api.nvim_set_option_value("winhighlight", "Normal:Normal,NormalFloat:Normal", { win = win })
		vim.fn.termopen("lazygit --work-tree " .. root .. " --git-dir " .. root .. "/.git", {
			on_exit = function()
				vim.api.nvim_win_close(0, true)
			end,
		})
		vim.cmd("startinsert")
	end
end

return { open_lazygit = open_lazygit }
