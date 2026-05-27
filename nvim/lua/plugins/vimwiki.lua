local M = {}

M.spec = { src = "https://github.com/vimwiki/vimwiki" }

-- These globals must be set before the plugin loads (before vim.pack.add)
-- They are set at module require() time, which happens before vim.pack.add() in pack.lua
vim.g.vimwiki_list = {
	{
		path = vim.fn.expand("~/Wiki"),
		syntax = "markdown",
		ext = ".md",
	},
}

-- Do not treat every .md file as a vimwiki file
vim.g.vimwiki_global_ext = 0

-- Disable ALL vimwiki key mappings — we define them all explicitly below
-- to avoid conflicts with BufferLine (<Tab>), Zellij (<C-Left>/<C-Right>), etc.
vim.g.vimwiki_key_mappings = {
	all_maps = 1,
	global = 0,
	headers = 0,
	text_objs = 0,
	table_format = 0,
	table_mappings = 0,
	lists = 0,
	links = 0,
	html = 0,
	mouse = 0,
}

function M.config()
	local group = vim.api.nvim_create_augroup("VimwikiKeymaps", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "vimwiki",
		callback = function()
			local map = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { buffer = true, desc = desc })
			end

			-- Navigation
			map("<CR>",        "<Plug>VimwikiFollowLink",      "Wiki follow link")
			map("<Backspace>", "<Plug>VimwikiGoBackLink",       "Wiki go back")
			map("<leader>wn",  "<Plug>VimwikiNextLink",         "Wiki next link")
			map("<leader>wp",  "<Plug>VimwikiPrevLink",         "Wiki prev link")

			-- Diary
			map("<leader>w<leader>w", "<Plug>VimwikiMakeDiaryNote",       "Wiki diary today")
			map("<leader>w<leader>i", "<Plug>VimwikiDiaryGenerateLinks",  "Wiki diary index")
			map("<leader>w<leader>y", "<Plug>VimwikiMakeYesterdayDiaryNote", "Wiki diary yesterday")
			map("<leader>w<leader>t", "<Plug>VimwikiMakeTomorrowDiaryNote",  "Wiki diary tomorrow")

			-- Todo checkboxes
			map("<C-Space>", "<Plug>VimwikiToggleListItem", "Wiki toggle checkbox")
		end,
	})

	-- Global mappings (outside wiki buffers)
	vim.keymap.set("n", "<leader>ww", "<Plug>VimwikiIndex",      { desc = "Wiki index" })
	vim.keymap.set("n", "<leader>wi", "<Plug>VimwikiDiaryIndex", { desc = "Wiki diary index" })
	vim.keymap.set("n", "<leader>wt", "<Plug>VimwikiTabIndex",   { desc = "Wiki index (tab)" })
end

return M
