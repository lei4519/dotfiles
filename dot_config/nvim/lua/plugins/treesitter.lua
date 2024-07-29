return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "v", desc = "Increment selection" },
    { "V", desc = "Decrement selection", mode = "x" },
  },
  opts = {
    ensure_installed = {
      "just",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-enter>",
        node_incremental = "<c-enter>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
