return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = { lookahead = true },
			move = { set_jumps = true },
		})

		local select = require("nvim-treesitter-textobjects.select").select_textobject
		local move = require("nvim-treesitter-textobjects.move")

		-- Selection (operator-pending + visual)
		local sel = function(query, group)
			return function()
				select(query, group)
			end
		end

		for _, mode in ipairs({ "x", "o" }) do
			vim.keymap.set(mode, "af", sel("@function.outer", "textobjects"), { desc = "a function" })
			vim.keymap.set(mode, "if", sel("@function.inner", "textobjects"), { desc = "inner function" })
			vim.keymap.set(mode, "ac", sel("@class.outer", "textobjects"), { desc = "a class" })
			vim.keymap.set(mode, "ic", sel("@class.inner", "textobjects"), { desc = "inner class" })
			vim.keymap.set(mode, "aa", sel("@parameter.outer", "textobjects"), { desc = "a parameter" })
			vim.keymap.set(mode, "ia", sel("@parameter.inner", "textobjects"), { desc = "inner parameter" })
		end

		-- Movement
		vim.keymap.set({ "n", "x", "o" }, "]f", function()
			move.goto_next_start("@function.outer", "textobjects")
		end, { desc = "Next function start" })
		vim.keymap.set({ "n", "x", "o" }, "]F", function()
			move.goto_next_end("@function.outer", "textobjects")
		end, { desc = "Next function end" })
		vim.keymap.set({ "n", "x", "o" }, "[f", function()
			move.goto_previous_start("@function.outer", "textobjects")
		end, { desc = "Prev function start" })
		vim.keymap.set({ "n", "x", "o" }, "[F", function()
			move.goto_previous_end("@function.outer", "textobjects")
		end, { desc = "Prev function end" })
		vim.keymap.set({ "n", "x", "o" }, "]c", function()
			move.goto_next_start("@class.outer", "textobjects")
		end, { desc = "Next class start" })
		vim.keymap.set({ "n", "x", "o" }, "[c", function()
			move.goto_previous_start("@class.outer", "textobjects")
		end, { desc = "Prev class start" })
	end,
}
