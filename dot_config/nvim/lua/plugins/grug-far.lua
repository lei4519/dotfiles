return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      -- engine = "astgrep", -- 'ripgrep' is default, but 'astgrep'
      keymaps = {
        -- replace = { n = "<localleader>r" },
        -- qflist = { n = "<localleader>q" },
        -- syncLocations = { n = "<localleader>s" },
        -- syncLine = { n = "<localleader>l" },
        close = { n = "q" },
        -- historyOpen = { n = "<localleader>t" },
        -- historyAdd = { n = "<localleader>a" },
        -- refresh = { n = "<localleader>f" },
        -- gotoLocation = { n = "<enter>" },
        -- pickHistoryEntry = { n = "<enter>" },
        -- abort = { n = "<localleader>b" },
      },
    })
  end,
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").grug_far()
        -- require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Replace in files (Grug Far)",
    },
    {
      "<leader>sA",
      function()
        require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Replace in files (Grug Far AST)",
    },

    {
      "<leader>sw",
      function()
        require("grug-far").grug_far({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Search under word by Grug Far",
    },
    {
      "<leader>sf",
      function()
        require("grug-far").grug_far({ prefills = { flags = vim.fn.expand("%"), search = vim.fn.expand("<cword>") } })
      end,
      desc = "Search current file by Grug Far",
    },
    {
      "<leader>sv",
      function()
        require("grug-far").with_visual_selection({ prefills = { flags = vim.fn.expand("%") } })
      end,
      desc = "Search selection by Grug Far",
    },
  },
}
