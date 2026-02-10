return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = function()
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",                          -- Bash
        "clangd",                          -- C/C++
        "cmake",                           -- CMake
        "dockerls",                        -- Dockefile
        "docker_compose_language_service", -- Docker Compose
        "jsonls",                          -- JSON
        "lua_ls",                          -- Lua
        "marksman",                        -- Markdown
        -- "ruff",                         -- Python (installed with pip)
        "yamlls",                          -- YAML

        -- TODO(tun43p): https://mason-registry.dev/registry/list
        -- "astro-language-server", -- Astro
        -- "bash-language-server", -- Bash
        -- "clangd", -- C/C++
        -- "cmake-language-server", -- CMake
        -- "css-lsp", -- CSS
        -- "deno", -- Deno
        -- "dockerfile-language-server", -- Dockefile
        -- "docker-compose-language-server", -- Docker Compose
        -- "eslint-lsp", -- Eslint
        -- "golangci-lint-langserver", -- Golang
        -- "gitlab-ci-ls", -- Gitlab CI
        -- "gradle-language-server", -- Gradle
        -- "html-lsp", -- HTML
        -- "json-lsp", -- JSON
        -- "kotlin-language-server", -- Kotlin
        -- "lua-language-server", -- Lua
        -- "marksman", -- Markdown
        -- "prisma-language-server", -- Prisma
        -- "python-language-server", -- Python
        -- "taplo", -- TOML
        -- "solidity", -- Solidity
        -- "tailwindcss-language-server", -- Tailwind CSS
        -- "vue-language-server", -- Vue
      },
      handlers = {
        function(server_name)
          vim.lsp.config(server_name, {})
        end,

        ["lua_ls"] = function()
          vim.lsp.config("lua_ls", {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            }
          })
        end,
      },
    })

    local servers = require("mason-lspconfig").get_installed_servers()
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
    
    local function setup_global_keymaps()
      vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
      end, { desc = "LSP Goto Definition" })
      
      vim.keymap.set("n", "gr", function()
        vim.lsp.buf.references()
      end, { desc = "LSP Goto References" })
      
      vim.keymap.set("n", "gi", function()
        vim.lsp.buf.implementation()
      end, { desc = "LSP Goto Implementation" })
      
      vim.keymap.set("n", "gt", function()
        vim.lsp.buf.type_definition()
      end, { desc = "LSP Goto Type Definition" })
      
      vim.keymap.set("n", "gl", function()
        vim.diagnostic.open_float()
      end, { desc = "Show Line Diagnostics" })
      
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev()
      end, { desc = "Previous Diagnostic" })
      
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next()
      end, { desc = "Next Diagnostic" })
      
      vim.keymap.set("n", "<leader>pa", function()
        vim.lsp.buf.code_action()
      end, { desc = "LSP Code Action" })
      
      vim.keymap.set("n", "<leader>pr", function()
        vim.lsp.buf.rename()
      end, { desc = "LSP Rename" })
      
      vim.keymap.set("n", "<leader>pf", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "LSP Format" })
      
      vim.keymap.set("n", "<leader>ps", function()
        vim.lsp.buf.workspace_symbol()
      end, { desc = "LSP Workspace Symbol" })
      
      vim.keymap.set("n", "<leader>pd", function()
        vim.diagnostic.setloclist()
      end, { desc = "LSP Diagnostics List" })
    end
    
    setup_global_keymaps()

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

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }
        
        vim.keymap.set("n", "K", function()
          vim.lsp.buf.hover()
        end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover Documentation" }))
        
        vim.keymap.set("i", "<C-k>", function()
          vim.lsp.buf.signature_help()
        end, vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
  end,
}
