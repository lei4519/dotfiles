--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- neovide
vim.g.neovide_refresh_rate = 60 -- 屏幕刷新率
vim.g.neovide_transparency = .9 -- 透明度
-- 字体
vim.opt.guifont = { "MesloLGS NF", "h16" }
vim.opt.linespace = 20

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"


-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "prettier" },
  { name = "rustfmt" },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "eslint", prefer_local = "node_modules/.bin" },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  { name = "gitsigns" },
  { name = "eslint", prefer_local = "node_modules/.bin" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- -- nvim-tree 自动关闭
-- lvim.autocommands.custom_groups = {
--   { "BufEnter", nested = true, callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--       vim.api.nvim_command("quit")
--     end
--   end },
-- }

require('setup')
