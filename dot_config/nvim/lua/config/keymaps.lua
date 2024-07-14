-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")

-- map("n", "/", "/\\V", { noremap = true })

-- kitty navigator --
-- vim.g.kitty_navigator_no_mappings = 1
map("n", "<C-h>", ":KittyNavigateLeft<CR>", { silent = true })
map("n", "<C-j>", ":KittyNavigateDown<CR>", { silent = true })
map("n", "<C-k>", ":KittyNavigateUp<CR>", { silent = true })
map("n", "<C-l>", ":KittyNavigateRight<CR>", { silent = true })
