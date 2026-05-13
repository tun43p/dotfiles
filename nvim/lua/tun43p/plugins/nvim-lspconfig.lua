return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "saghen/blink.cmp" },
  },
  config = function()
    require("mason").setup({})

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "docker_compose_language_service",
        "jsonls",
        "lua_ls",
        "marksman",
        "ruff",
        "rust_analyzer",
        "yamlls",
        "zls",
      },
      automatic_enable = {
        exclude = { "stylua" }, -- via conform, not needed
      },
    })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Goto Definition" })
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "LSP Goto References" })
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "LSP Goto Implementation" })
    vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "LSP Goto Type Definition" })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end,
      { desc = "Previous Diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end,
      { desc = "Next Diagnostic" })
    vim.keymap.set("n", "<leader>pa", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
    vim.keymap.set("n", "<leader>pr", vim.lsp.buf.rename, { desc = "LSP Rename" })
    vim.keymap.set("n", "<leader>pf", function() vim.lsp.buf.format({ async = true }) end, { desc = "LSP Format" })
    vim.keymap.set("n", "<leader>ps", vim.lsp.buf.workspace_symbol, { desc = "LSP Workspace Symbol" })
    vim.keymap.set("n", "<leader>pd", vim.diagnostic.setloclist, { desc = "LSP Diagnostics List" })

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }

        vim.keymap.set("n", "K", vim.lsp.buf.hover,
          vim.tbl_deep_extend("force", opts, { desc = "LSP Hover Documentation" }))

        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help,
          vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
      end,
    })
  end,
}
