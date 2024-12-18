return {
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
    options = {
      enabled = true,
    },
    -- plugins = {
    --   kitty = {
    --     enabled = true,
    --   },
    -- },
  },
}
