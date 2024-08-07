-- function _G.set_terminal_keymaps()
--   local opts = { buffer = 0 }
--   vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
--   vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
--   vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
--   vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
--   vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
--   vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
-- end
--
-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

return {
  "akinsho/toggleterm.nvim",
  enabled = true,
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return vim.o.lines * 0.4
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.3
      end
    end,
  },
  config = true,
  keys = {
    { "<localleader>\\", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
    { "<localleader>s", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal" },
    { "<localleader>v", "<cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm vertical" },
    { "<localleader>2", "<cmd>ToggleTerm 2<cr>", desc = "ToggleTerm ID 2" },
    { "<localleader>3", "<cmd>ToggleTerm 3<cr>", desc = "ToggleTerm ID 3" },
    { "<localleader>4", "<cmd>ToggleTerm 4<cr>", desc = "ToggleTerm ID 4" },
    { "<localleader>5", "<cmd>ToggleTerm 4<cr>", desc = "ToggleTerm ID 5" },
    { "<localleader>V", "<cmd>ToggleTermSendVisualSelection<cr>", desc = "ToggleTermSendVisualSelection" },
    { "<localleader>c", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "ToggleTermSendCurrentLine" },
    { "<localleader>a", "<cmd>ToggleTermToggleAll<cr>", desc = "ToggleTermToggleAll" },
    { "<localleader>f", "<cmd>TermSelect<cr>", desc = "TermSelect" },
  },
}
