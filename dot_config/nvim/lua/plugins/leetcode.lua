return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- telescope 所需
    "MunifTanjim/nui.nvim",

    -- 可选
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- 配置放在这里
    lang = "golang",
    cn = {
      enabled = true,
    },
    ---@type lc.storage
    storage = {
      home = "/Users/lay/Lay/l-algo/src",
    },
  },
  -- keys = {
  --   { "<localleader>l", "<cmd>Leet list<cr>", desc = "Leet list" },
  --   { "<localleader>t", "<cmd>Leet test<cr>", desc = "Leet test" },
  --   { "<localleader>s", "<cmd>Leet submit<cr>", desc = "Leet submit" },
  --   { "<localleader>d", "<cmd>Leet desc<cr>", desc = "Leet desc" },
  -- },
}
