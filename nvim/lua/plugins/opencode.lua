local M = {}

M.spec = { src = "https://github.com/sudo-tee/opencode.nvim" }

function M.config()
	require("opencode").setup({
		ui = {
			icons = { preset = "emoji" },
		},
	})
end

return M
