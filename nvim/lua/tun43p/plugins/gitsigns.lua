return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "-" },
			changedelete = { text = "~" },
			untracked = { text = "|" },
		},
		signs_staged = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "-" },
			changedelete = { text = "~" },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 300,
			virt_text_pos = "eol",
		},
		on_attach = function(bufnr)
			local gs = require("gitsigns")
			local opts = function(desc)
				return { buffer = bufnr, desc = desc }
			end

			-- Navigation between hunks
			vim.keymap.set("n", "]h", gs.next_hunk, opts("Next hunk"))
			vim.keymap.set("n", "[h", gs.prev_hunk, opts("Previous hunk"))

			-- Actions
			vim.keymap.set("n", "<leader>ghs", gs.stage_hunk, opts("Stage hunk"))
			vim.keymap.set("n", "<leader>ghr", gs.reset_hunk, opts("Reset hunk"))
			vim.keymap.set("v", "<leader>ghs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, opts("Stage hunk"))
			vim.keymap.set("v", "<leader>ghr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, opts("Reset hunk"))
			vim.keymap.set("n", "<leader>ghS", gs.stage_buffer, opts("Stage buffer"))
			vim.keymap.set("n", "<leader>ghR", gs.reset_buffer, opts("Reset buffer"))
			vim.keymap.set("n", "<leader>ghp", gs.preview_hunk, opts("Preview hunk"))
			vim.keymap.set("n", "<leader>ghb", function()
				gs.blame_line({ full = true })
			end, opts("Blame line"))
			vim.keymap.set("n", "<leader>ghd", gs.diffthis, opts("Diff this"))
		end,
	},
}
