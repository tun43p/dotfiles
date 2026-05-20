-- Commands for Neovim
local M = {}

-- Function to initialize custom commands
function M.setup()
	vim.api.nvim_create_user_command("ExportLspServers", function()
		require("utils.export_lsp_servers").export_servers()
	end, {
		desc = "Export the list of available LSP servers",
	})
end

return M
