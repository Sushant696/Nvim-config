return {
   "mfussenegger/nvim-dap",
   config = function()
    local dap = require('dap')
   vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>d', dap.continue, {})
   end
 }
