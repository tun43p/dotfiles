local M = {}

M.spec = { src = "https://github.com/catgoose/nvim-colorizer.lua" }

function M.config()
	require("colorizer").setup()
end

return M
