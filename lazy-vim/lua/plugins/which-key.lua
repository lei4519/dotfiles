return {
  "folke/which-key.nvim",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = {
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        k = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
      },
      ["<leader>b"] = {
        o = { "<cmd>BufferLineCloseOthers<cr>", "Close Other Buffer" },
        l = { "<cmd>BufferLineCloseLeft<cr>", "Close Left Buffer" },
        r = { "<cmd>BufferLineCloseRight<cr>", "Close Right Buffer" },
      },
      ["<leader>w"] = { "<cmd>bd<cr>", "Close Current Buffer" },
    },
  },
}
