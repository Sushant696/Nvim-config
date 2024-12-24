return {
  "Rics-Dev/project-explorer.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    paths = { "/mnt/nvme0n1p5/*" },
    newProjectPath = "/mnt/nvme0n1p5/work/*",
    file_explorer = function(dir)
      vim.cmd("Neotree close")
      vim.cmd("Neotree " .. dir)
    end,
    -- Or for oil.nvim:
    -- file_explorer = function(dir)
    --   require("oil").open(dir)
    -- end,
  },
  config = function(_, opts)
    require("project_explorer").setup(opts)
  end,
  keys = {
    { "<leader>fp", "<cmd>ProjectExplorer<cr>", desc = "Project Explorer" },
  },
  lazy = false,
}
