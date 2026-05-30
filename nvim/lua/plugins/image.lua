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
				floating_windows = false,
				filetypes = { "markdown", "vimwiki" },
			},
		},
		max_width = nil,
		max_height = nil,
		max_width_window_percentage = nil,
		max_height_window_percentage = 50,
		scale_factor = 1.0,
		kitty_direct_chunk_size = 4096,
		window_overlap_clear_enabled = false,
		editor_only_render_when_focused = false,
		hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
	})
end

return M
