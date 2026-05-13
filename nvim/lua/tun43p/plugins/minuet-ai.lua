return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	config = function()
		require("minuet").setup({
			notify = "debug",
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
	end,
}
