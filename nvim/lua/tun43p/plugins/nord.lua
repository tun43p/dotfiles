return {
  "arcticicestudio/nord-vim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.nord_italic = 1
    vim.g.nord_italic_comments = 1
    vim.g.nord_underline = 1
    vim.g.nord_uniform_diff_background = 1
    vim.g.nord_cursor_line_number_background = 1

    vim.cmd.colorscheme("nord")

    -- Background transparent (nord-vim n'a pas d'option native)
    local transparent_groups = {
      "Normal", "NormalNC", "NormalFloat", "FloatBorder",
      "SignColumn", "EndOfBuffer", "LineNr", "CursorLineNr",
      "StatusLine", "StatusLineNC", "VertSplit", "WinSeparator",
      "TabLine", "TabLineFill",
    }
    for _, group in ipairs(transparent_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
}
