return {
  "navarasu/onedark.nvim",
  config = function()
    require("onedark").setup({
      style = 'darker',     -- Choose a darker variant
      colors = {
        red = "#e06c75",    -- Red for keywords
        purple = "#c678dd", -- Purple for VS Code-like functions
        green = "#98c379",  -- Soft green for strings
        white = "#f8f8f8",
        blue = "#61afef",   -- Soft blue for functions
      },
      highlights = {
        ["@keyword"] = { fg = "$red" },                   -- Red for keywords
        ["@string"] = { fg = "$green" },                  -- Subtle green for strings
        ["@function"] = { fg = "$blue", fmt = "italic" }, -- Soft blue, italic for functions
        ["@function.builtin"] = { fg = "$purple" },       -- Purple for built-in functions
      },
    })
    vim.cmd.colorscheme "onedark"
  end,
}
