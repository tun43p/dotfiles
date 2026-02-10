return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("codeium").setup({
      enable_cmd_source = true,
    })
  end
}
