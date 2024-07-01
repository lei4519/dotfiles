return {
  "echasnovski/mini-git",
  version = "*",
  main = "mini.git",
  keys = {
    { "<leader>gmr", "<cmd>MiniGit.show_range_history()<cr>", desc = "shows how certain line range evolved" },
    { "<leader>gmd", "<cmd>MiniGit.show_diff_source()<cr>", desc = " shows file state as it was at diff entry" },
    { "<leader>gma", "<cmd>MiniGit.show_at_cursor()<cr>", desc = "shows Git related data depending on context" },
  },
  config = function()
    require("mini.git").setup({})
  end,
}
