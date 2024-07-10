-- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file
return {
  "folke/zen-mode.nvim",
  keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
  opts = {
    on_open = function()
      vim.cmd("TWEnable")
    end,
    on_close = function()
      vim.cmd("TWDisable")
    end,
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
}
