return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "emmet_ls", "jdtls", "solidity" },
      })

      -- Automatically handle server setup with mason-lspconfig
      require("mason-lspconfig").setup_handlers({
        function(server_name)     -- Default handler for installed servers
          if server_name == "tsserver" then
            server_name = "ts_ls" -- Rename to "ts_ls" for lspconfig
          end

          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          require("lspconfig")[server_name].setup({
            capabilities = capabilities, -- set to default capabilities
          })
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Get capabilities for nvim-cmp autocompletion
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      -- Set up lua_ls with capabilities
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      -- Set up ts_ls with capabilities (for TypeScript and JavaScript)
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      -- Set up HTML LSP
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      -- Set up CSS LSP
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      -- Set up Solidity LSP
      lspconfig.solidity.setup({
        capabilities = capabilities,
      })

      -- Set up Emmet LSP
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
      })

      -- Set up Java LSP (jdtls)
      lspconfig.jdtls.setup({
        capabilities = capabilities,
        cmd = { 'jdtls' },
        root_dir = require('lspconfig').util.root_pattern(".git", "pom.xml", "build.gradle", ".project"), -- Add root dir pattern for Java
      })

      -- Set keymaps for LSP actions
      vim.keymap.set("n", "gh", vim.lsp.buf.hover, {})                       -- Hover information
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})                  -- Go to definition
      vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, {}) -- Code actions
    end,
  },
}
