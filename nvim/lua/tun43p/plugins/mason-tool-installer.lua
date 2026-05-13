return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Formatters
        "prettierd",
        "stylua",
        "clang-format",
        "cmakelang",
        "gofumpt",
        "ktlint",
        "ruff",

        -- Linters
        "eslint_d",
        "cpplint",
        "cmakelint",
        "golangci-lint",
        "htmlhint",
        "jsonlint",
        "markdownlint",
        "yamllint",
      },
      auto_update = false,
      run_on_start = true,
    })
  end,
}
