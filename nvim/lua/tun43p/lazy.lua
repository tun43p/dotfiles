local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup( {{ import = "tun43p.plugins" }}, {
	checker = {
		enabled = false,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

require("notify").setup({
  background_colour = "#000000",
})
