return {
  "f-person/git-blame.nvim",
  enabled = false,
  config = function()
    require("gitblame").setup({
      --Note how the `gitblame_` prefix is omitted in `setup`
      enabled = false,
    })
  end,
}
