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

vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")

map("n", "/", "/\\V", { noremap = true })

-- kitty navigator --
-- vim.g.kitty_navigator_no_mappings = 1
map("n", "<C-h>", ":KittyNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", ":KittyNavigateDown<CR>", { silent = true })
map("n", "<C-k>", ":KittyNavigateUp<CR>", { silent = true })
map("n", "<C-l>", ":KittyNavigateRight<CR>", { silent = true })
