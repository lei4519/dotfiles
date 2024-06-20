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
}
