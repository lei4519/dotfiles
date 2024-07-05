return {
  "keaising/im-select.nvim",
  enabled = IS_LINUX,
  config = function()
    require("im_select").setup({})
  end,
}
