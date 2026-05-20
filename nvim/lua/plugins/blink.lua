local M = {}

M.spec = {
	{ src = "https://github.com/milanglacier/minuet-ai.nvim" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" },
}

function M.config()
	-- minuet must be configured before blink references it
	require("minuet").setup({
		provider = "openai_compatible",
		request_timeout = 2.5,
		throttle = 1500,
		debounce = 600,
		context_window = 768,
		provider_options = {
			openai_compatible = {
				api_key = "OPENROUTER_API_KEY",
				end_point = "https://openrouter.ai/api/v1/chat/completions",
				model = "deepseek/deepseek-v4-flash",
				name = "Openrouter",
				optional = {
					max_tokens = 56,
					top_p = 0.9,
					provider = {
						sort = "throughput",
					},
					reasoning_effort = "none",
				},
			},
		},
	})

	-- Build native fuzzy matcher binary if missing (blink.cmp v2)
	local blink_root = vim.fn.stdpath("data") .. "/site/pack/core/opt/blink.cmp"
	local has_lib = vim.fn.glob(blink_root .. "/target/release/libblink_cmp_fuzzy.{dylib,so,dll}") ~= ""
	if not has_lib then
		vim.notify("Building blink.cmp native library (one-time)...", vim.log.levels.INFO)
		local obj = vim.system({ "cargo", "build", "--release" }, { cwd = blink_root }):wait()
		if obj.code == 0 then
			vim.notify("blink.cmp build done", vim.log.levels.INFO)
		else
			vim.notify("blink.cmp build failed:\n" .. (obj.stderr or ""), vim.log.levels.ERROR)
		end
	end

	require("blink.cmp").setup({
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
	})
end

return M
