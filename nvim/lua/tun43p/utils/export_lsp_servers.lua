-- Script to export the list of available LSP servers 
local function export_servers()
  -- Get the list of available servers
  local servers = require('mason-lspconfig').get_available_servers()
  
  -- Convert the list to JSON format
  local json = vim.json.encode(servers)
  
  -- Output file path
  local output_file = vim.fn.expand("~/.config/nvim/services.json")
  
  -- Create the directory if it doesn't exist
  local config_dir = vim.fn.expand("~/.config/nvim")
  if vim.fn.isdirectory(config_dir) == 0 then
    vim.fn.mkdir(config_dir, "p")
  end
  
  -- Write to the file
  local file = io.open(output_file, "w")
  if file then
    file:write(json)
    file:close()
    print("Servers exported to " .. output_file)
  else
    print("Error writing to file " .. output_file)
  end
end

return {
  export_servers = export_servers
}
