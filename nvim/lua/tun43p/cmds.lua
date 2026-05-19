-- Commands for Neovim
local M = {}

function M.pick_session()
	local persistence = require("persistence")
	local session_dir = (persistence.config and persistence.config.dir) or (vim.fn.stdpath("state") .. "/sessions/")
	local sessions = {}

	for _, file in ipairs(vim.fn.glob(session_dir .. "*.vim", false, true)) do
		local name = vim.fn.fnamemodify(file, ":t:r"):gsub("%%", "/")
		table.insert(sessions, { text = name, file = file })
	end

	if #sessions == 0 then
		vim.notify("No sessions found", vim.log.levels.WARN)
		return
	end

	Snacks.picker.pick({
		title = "Sessions",
		items = sessions,
		format = function(item)
			return { { item.text } }
		end,
		confirm = function(picker, item)
			picker:close()
			vim.cmd("source " .. vim.fn.fnameescape(item.file))
		end,
		actions = {
			delete_session = function(picker, item)
				vim.fn.delete(item.file)
				vim.notify("Session deleted: " .. item.text, vim.log.levels.INFO)
				picker:close()
			end,
		},
		win = {
			input = {
				keys = { ["<C-d>"] = { "delete_session", mode = { "n", "i" } } },
			},
			list = {
				keys = { ["<C-d>"] = "delete_session" },
			},
		},
	})
end

-- Function to initialize custom commands
function M.setup()
	-- Command to export the list of available LSP servers
	vim.api.nvim_create_user_command("ExportLspServers", function()
		require("tun43p.utils.export_lsp_servers").export_servers()
	end, {
		desc = "Export the list of available LSP servers",
	})
end

return M
