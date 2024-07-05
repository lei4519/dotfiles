return {
  "DreamMaoMao/yazi.nvim",
  enabled = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },

  keys = {
    { "<leader>z", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
  },
}
