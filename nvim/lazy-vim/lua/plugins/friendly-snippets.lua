return {
  "rafamadriz/friendly-snippets",
  enabled = false,
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/dotfiles/lazy-vim/lua/snippets" })
  end,
}
