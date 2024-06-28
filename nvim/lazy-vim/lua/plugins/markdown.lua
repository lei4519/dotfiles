return {
  enabled = false,
  "MeanderingProgrammer/markdown.nvim",
  -- name = "markdown.nvim", -- Only needed if you have another plugin named markdown.nvim
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("render-markdown").setup({})
  end,
}
