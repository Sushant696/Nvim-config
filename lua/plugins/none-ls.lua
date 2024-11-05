return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          -- null_ls.builtins.diagnostics.eslint_d
        },
      })

      -- keymap n = normal mode , leader = space gf = letters vim.lsp.buf.format function to be executed
      vim.keymap.set("n", "<S-A-i>", vim.lsp.buf.format, {})
    end,
  },
}
