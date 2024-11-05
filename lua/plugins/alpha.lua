return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.startify")

    -- Define different ASCII arts as headers
    local headers = {
      {
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
      },
      {
        [[                                                                       ]],
        [[       ▄████████    ▄████████ ███    █▄   ▄████████    ▄████████        ]],
        [[      ███    ███   ███    ███ ███    ███ ███    ███   ███    ███        ]],
        [[      ███    ███   ███    ███ ███    ███ ███    ███   ███    ███        ]],
        [[      ███    ███   ███    ███ ███    ███ ███    ███   ███    ███        ]],
        [[    ▀███████████ ▀███████████ ███    ███ ███    ███ ▀███████████        ]],
        [[      ███    ███   ███    ███ ███    ███ ███    ███   ███    ███        ]],
        [[      ███    ███   ███    ███ ███    ███ ███    ███   ███    ███        ]],
        [[      ███    ███   ███    ███ ████████▀   ▀██████▀    ███    ███        ]],
        [[                                                                       ]],
      },

    }

    -- Current header index
    local current_header = 1

    -- Function to toggle header
    local function toggle_header()
      current_header = current_header % #headers + 1
      dashboard.section.header.val = headers[current_header]
      alpha.redraw() -- Redraw the alpha dashboard with the new header
    end

    -- Set the initial header
    dashboard.section.header.val = headers[current_header]

    -- Setup alpha with the current dashboard options
    alpha.setup(dashboard.opts)

    -- Add a keybinding to toggle the header
    vim.api.nvim_set_keymap('n', '<leader>th', ':lua toggle_header()<CR>', { noremap = true, silent = true })

    -- Expose the toggle_header function globally
    _G.toggle_header = toggle_header
  end,
}
