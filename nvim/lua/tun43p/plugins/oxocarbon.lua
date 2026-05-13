return {
  "nyoom-engineering/oxocarbon.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.cmd.colorscheme("oxocarbon")

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
