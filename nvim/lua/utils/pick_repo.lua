local function pick_repo()
	local code_dir = os.getenv("CODE")
	if not code_dir then
		vim.notify("$CODE is not set", vim.log.levels.ERROR)
		return
	end

	local result = vim.fn.systemlist({ "fd", "--hidden", "--type", "d", "--glob", ".git", code_dir })
	if vim.v.shell_error ~= 0 then
		vim.notify("fd failed", vim.log.levels.ERROR)
		return
	end

	local repos = {}
	for _, git_path in ipairs(result) do
		-- strip trailing newline and /.git suffix to get repo root
		local repo_path = vim.fn.fnamemodify(git_path:gsub("[/\r\n]+$", ""), ":h")
		local display = repo_path:gsub("^" .. vim.pesc(code_dir) .. "/", "")
		table.insert(repos, { display = display, path = repo_path })
	end

	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	pickers
		.new({}, {
			prompt_title = "Repos",
			finder = finders.new_table({
				results = repos,
				entry_maker = function(entry)
					return {
						value = entry.path,
						display = entry.display,
						ordinal = entry.display,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local path = selection.value

					-- close all file buffers
					for _, buf in ipairs(vim.api.nvim_list_bufs()) do
						if vim.api.nvim_buf_is_loaded(buf) then
							local buftype = vim.bo[buf].buftype
							if buftype == "" then
								vim.api.nvim_buf_delete(buf, { force = true })
							end
						end
					end

					-- change global cwd (neo-tree follows via bind_to_cwd)
					vim.cmd("cd " .. vim.fn.fnameescape(path))

					-- refresh neo-tree on new root
					require("neo-tree.command").execute({ action = "focus", dir = path })

					vim.notify("→ " .. selection.display, vim.log.levels.INFO)
				end)
				return true
			end,
		})
		:find()
end

return { pick_repo = pick_repo }
