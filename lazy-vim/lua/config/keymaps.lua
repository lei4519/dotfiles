-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other Buffer" })
map("n", "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close Left Buffer" })
map("n", "<leader>br", "<cmd>BufferLineCloseRight<cr>", { desc = "Close Right Buffer" })

map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
map("n", "gk", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Line Diagnostics" })
