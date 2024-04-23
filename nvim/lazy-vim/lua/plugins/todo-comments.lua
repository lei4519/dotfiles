return {
  "folke/todo-comments.nvim",
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*:?\s+]], -- pattern or table of patterns, used for highlighting (vim regex)
    },
    search = {
      pattern = [[\b(KEYWORDS)\s*:?\s+]], -- ripgrep regex
    },
  },
}
