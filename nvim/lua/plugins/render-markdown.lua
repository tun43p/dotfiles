local M = {}

M.spec = { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }

function M.config()
	require("render-markdown").setup({
		render_modes = true,
		sign = { enabled = false },
		heading = {
			sign = false,
			icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
		},
		code = {
			sign = false,
			width = "block",
			right_pad = 1,
		},
		bullet = {
			icons = { "●", "○", "◆", "◇" },
		},
		latex = { enabled = false },
	})

	vim.keymap.set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Toggle markdown render" })
end

return M
