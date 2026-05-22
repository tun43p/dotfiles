local function find_and_replace()
	local actions = require("telescope.actions")
	local builtin = require("telescope.builtin")
	local action_state = require("telescope.actions.state")

	local search = vim.fn.input("Search: ")
	if search == "" then
		return
	end

	local replace = vim.fn.input("Replace: ")
	if replace == "" then
		local confirm = vim.fn.confirm("Replace with empty string?", "&Yes\n&No", 2)
		if confirm ~= 1 then
			return
		end
	end

	builtin.live_grep({
		default_text = search,
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				local picker = action_state.get_current_picker(prompt_bufnr)
				local multi = picker:get_multi_selection()
				local items = #multi > 0 and multi or { action_state.get_selected_entry() }
				actions.close(prompt_bufnr)
				local qf_items = {}

				for _, item in ipairs(items) do
					table.insert(qf_items, {
						filename = item.filename or item.path,
						lnum = item.lnum or 1,
						col = item.col or 0,
						text = item.text or "",
					})
				end

				vim.fn.setqflist({}, "r", { items = qf_items })

				local esc_s = vim.fn.escape(search, "/\\.[]^$*~&")
				local esc_r = vim.fn.escape(replace, "/\\&~")
				local ok, err = pcall(vim.cmd, "cfdo s/" .. esc_s .. "/" .. esc_r .. "/g | update")

				if not ok then
					vim.notify("Find and replace failed: " .. tostring(err), vim.log.levels.ERROR)
				end
			end)

			return true
		end,
	})
end

return { find_and_replace = find_and_replace }
