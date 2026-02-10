-- Commands for Neovim
local M = {}

-- Function to initialize custom commands
function M.setup()
  -- Command to export the list of available LSP servers
  vim.api.nvim_create_user_command("ExportLspServers", function()
    require("tun43p.utils.export_lsp_servers").export_servers()
  end, {
    desc = "Export the list of available LSP servers"
  })
end

return M
