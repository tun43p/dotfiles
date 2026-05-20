local M = {}

M.spec = { src = "https://github.com/ruifm/gitlinker.nvim" }

function M.config()
	require("gitlinker").setup({ mappings = nil })

	vim.keymap.set("n", "<leader>gb", function()
		require("gitlinker").get_buf_range_url("n", {
			action_callback = require("gitlinker.actions").open_in_browser,
		})
	end, { desc = "Open in browser" })

	vim.keymap.set("v", "<leader>gb", function()
		require("gitlinker").get_buf_range_url("v", {
			action_callback = require("gitlinker.actions").open_in_browser,
		})
	end, { desc = "Open in browser" })
end

return M
