local M = {}

M.spec = { src = "https://github.com/pimalaya/himalaya-vim" }

function M.config()
	vim.g.himalaya_account_picker = "telescope"

	local map = vim.keymap.set
	map("n", "<leader>ml", "<cmd>Himalaya<cr>", { desc = "Mail list" })
	map("n", "<leader>mw", "<cmd>HimalayaWrite<cr>", { desc = "Mail write" })
	map("n", "<leader>mc", "<cmd>HimalayaAccounts<cr>", { desc = "Mail change account" })
	map("n", "<leader>mf", "<cmd>HimalayaFolders<cr>", { desc = "Mail change folder" })
end

return M
