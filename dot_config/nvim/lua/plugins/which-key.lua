return {
  "folke/which-key.nvim",
  opts = {
    plugins = { spelling = true },
    defaults = {
      mode = { "n", "v" },
      ["g"] = {
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        A = {
          "<cmd>lua vim.lsp.buf.code_action({ context={ only = { 'source' }, diagnostics = {} } })<cr>",
          "Source Action",
        },
        k = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Line Diagnostics" },
      },
      ["<leader>b"] = {
        o = { "<cmd>BufferLineCloseOthers<cr>", "Close Other Buffer" },
        l = { "<cmd>BufferLineCloseLeft<cr>", "Close Left Buffer" },
        r = { "<cmd>BufferLineCloseRight<cr>", "Close Right Buffer" },
      },
      ["<leader>\\"] = {
        name = "+toggleterm",
        ["\\"] = { "<cmd>ToggleTerm direction=vertical<cr>", "ToggleTerm" },
        s = { "<cmd>ToggleTerm direction=horizontal<cr>", "ToggleTerm horizontal" },
        v = { "<cmd>ToggleTerm direction=vertical<cr>", "ToggleTerm vertical" },
        a = { "<cmd>ToggleTermToggleAll<cr>", "ToggleTermToggleAll" },
        f = { "<cmd>TermSelect<cr>", "TermSelect" },
        c = { "<cmd>ToggleTermSendCurrentLine<cr>", "ToggleTermSendCurrentLine" },
        V = { "<cmd>ToggleTermSendVisualSelection<cr>", "ToggleTermSendVisualSelection" },
        ["2"] = { "<cmd>ToggleTerm 2<cr>", "ToggleTerm ID 2" },
        ["3"] = { "<cmd>ToggleTerm 3<cr>", "ToggleTerm ID 3" },
        ["4"] = { "<cmd>ToggleTerm 4<cr>", "ToggleTerm ID 4" },
        ["5"] = { "<cmd>ToggleTerm 4<cr>", "ToggleTerm ID 5" },
      },
    },
  },
}
