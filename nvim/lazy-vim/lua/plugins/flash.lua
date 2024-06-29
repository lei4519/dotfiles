-- https://github.com/folke/flash.nvim
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  vscode = true,
  ---@type Flash.Config
  opts = {
    label = {
      style = "inline", ---@type "eol" | "overlay" | "right_align" | "inline"
    },
    modes = {
      search = {
        enabled = true,
      },
      char = {
        enabled = true,
      },
    },
  },
  -- keys = {
  --   {
  --     "s",
  --     mode = { "n", "x", "o" },
  --     function()
  --       require("flash").jump()
  --     end,
  --     desc = "Flash",
  --   },
  --   {
  --     "S",
  --     mode = { "n", "x", "o" },
  --     function()
  --       require("flash").treesitter()
  --     end,
  --     desc = "Flash Treesitter",
  --   },
  --   {
  --     "<localleader>r",
  --     mode = "o",
  --     function()
  --       require("flash").remote()
  --     end,
  --     desc = "Remote Flash",
  --   },
  --   {
  --     "<localleader>R",
  --     mode = { "o", "x" },
  --     function()
  --       require("flash").treesitter_search()
  --     end,
  --     desc = "Treesitter Search",
  --   },
  -- },
}
