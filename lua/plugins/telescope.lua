local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      -- Enable hidden file visibility globally
      find_command = { "rg", "--ignore", "--hidden", "--files", "--glob", ".env" },
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
    },
  })
end



return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.3",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  config = config,
  keys = {
    mapvimkey("<leader>fr", "Telescope keymaps", "Show Keymaps"),
    mapvimkey("<leader>fi", "Telescope help_tags", "Show Help Tags"),
    mapvimkey("<leader>ff", "Telescope find_files", "Find Files"),
    mapvimkey("<leader>fj", "Telescope live_grep", "Live Grep"),
    mapvimkey("<leader>fb", "Telescope buffers", "Find Buffers"),
    vim.api.nvim_set_keymap(
      "n",
      "<leader>fh",
      "<cmd>Telescope find_files hidden=true no_ignore=true<CR>",
      { noremap = true, silent = true }
    )

  },
}
