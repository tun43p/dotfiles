local M = {}

M.spec = {
	src = "https://github.com/vimpostor/vim-tpipeline",
}

function M.config()
	if vim.env.TMUX == nil then
		return
	end
	-- autoembed: tpipeline overrides status-left/right when entering neovim
	vim.g.tpipeline_autoembed = 1
	-- restore tmux status-left/right to original values when leaving neovim
	vim.g.tpipeline_restore = 1
	-- hide neovim's own statusline (tpipeline renders it in the tmux bar)
	vim.opt.laststatus = 0
end

return M
