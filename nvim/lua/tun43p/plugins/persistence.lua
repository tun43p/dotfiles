return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		{
			"<leader>ps",
			function()
				local persistence = require("persistence")
				local session_dir = persistence.config and persistence.config.dir
					or vim.fn.stdpath("state") .. "/sessions/"
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
							keys = {
								["<C-d>"] = { "delete_session", mode = { "n", "i" } },
							},
						},
						list = {
							keys = {
								["<C-d>"] = "delete_session",
							},
						},
					},
				})
			end,
			desc = "Pick session",
		},
		{
			"<leader>pl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore last session",
		},
		{
			"<leader>pd",
			function()
				require("persistence").stop()
			end,
			desc = "Stop session persistence",
		},
	},
}
