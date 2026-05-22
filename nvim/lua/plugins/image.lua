local M = {}

M.spec = { src = "https://github.com/3rd/image.nvim" }

-- TODO: This don't work in markdown files
function M.config()
	require("image").setup({
		backend = "kitty",
		processor = "magick_cli",
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = false,
				download_remote_images = true,
				only_render_image_at_cursor = false,
				filetypes = { "markdown" },
			},
		},
		max_width = 100,
		max_height = 12,
		max_height_window_percentage = 50,
		window_overlap_clear_enabled = true,
	})
end

return M
