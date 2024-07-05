return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  keys = { { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Treesj Toogle" } },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
    })
  end,
}
