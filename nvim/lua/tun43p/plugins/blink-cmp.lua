return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = {
		{ "milanglacier/minuet-ai.nvim" },
	},
	---@module 'blink.cmp'
	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<A-y>"] = {
				function(cmp)
					cmp.show({ providers = { "minuet" } })
				end,
			},
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		snippets = { preset = "default" },
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = { auto_show = true, auto_show_delay_ms = 200 },
			menu = { border = "rounded" },
			ghost_text = { enabled = true },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "minuet" },
			per_filetype = {
				opencode = { "lsp", "path", "snippets", "buffer" },
			},
			providers = {
				buffer = { min_keyword_length = 3 },
				snippets = { min_keyword_length = 2 },
				minuet = {
					name = "minuet",
					module = "minuet.blink",
					score_offset = 100,
				},
			},
		},
		signature = { enabled = true, window = { border = "rounded" } },
		fuzzy = { implementation = "prefer_rust_with_warning" },
		cmdline = {
			enabled = true,
			keymap = { preset = "cmdline" },
			completion = { menu = { auto_show = true } },
		},
		opts_extend = { "sources.default" },
	},
	-- This helps linters recognize the type without affecting execution
}
