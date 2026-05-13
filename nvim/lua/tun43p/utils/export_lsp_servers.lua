local function export_servers()
	local registry = require("mason-registry")
	local servers = {}

	for _, pkg in ipairs(registry.get_all_packages()) do
		for _, category in ipairs(pkg.spec.categories or {}) do
			if category == "LSP" then
				table.insert(servers, pkg.name)
				break
			end
		end
	end

	table.sort(servers)

	local output_file = vim.fn.expand("~/.config/nvim/services.json")
	local config_dir = vim.fn.expand("~/.config/nvim")
	if vim.fn.isdirectory(config_dir) == 0 then
		vim.fn.mkdir(config_dir, "p")
	end

	local file = io.open(output_file, "w")
	if file then
		file:write(vim.json.encode(servers))
		file:close()
		print("Servers exported to " .. output_file)
	else
		print("Error writing to file " .. output_file)
	end
end

return {
	export_servers = export_servers,
}
