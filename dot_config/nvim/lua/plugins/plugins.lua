return {
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "E",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      -- {
      --   "w",
      --   "<cmd>lua require('spider').motion('w')<CR>",
      --   mode = { "n", "o", "x" },
      -- },
      {
        "B",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "tzachar/highlight-undo.nvim",
    config = true,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    config = true,
  },
  -- {
  --   "shortcuts/no-neck-pain.nvim",
  --   version = "*",
  --   keys = { { "<leader>uz", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" } },
  -- },
  {
    -- enabled = false,
    "folke/zen-mode.nvim",
    keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
    opts = {
      -- on_open = function()
      --   vim.cmd("TWEnable")
      -- end,
      -- on_close = function()
      --   vim.cmd("TWDisable")
      -- end,
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      -- plugins = {
      -- kitty = {
      --   enabled = true,
      --   font = "+4", -- font size increment
      -- },
      -- },
    },
  },
  {
    -- 窗口边框颜色
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, 2, { require("NeoComposer.ui").status_recording })
    end,
  },
  { "kevinhwang91/nvim-bqf", ft = "qf", dependencies = { "junegunn/fzf" } },
  {
    "potamides/pantran.nvim",
    opts = {
      default_engine = "google",
    },
    keys = { { "<leader>tn", "<cmd>Pantran<CR>", desc = "Translate" } },
  },
}
