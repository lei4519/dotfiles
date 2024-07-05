return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
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
  },
}
