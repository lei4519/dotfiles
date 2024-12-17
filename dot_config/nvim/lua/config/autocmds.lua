-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit" }, -- "markdown"
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

LazyVim.lsp.on_attach(function(client, buffer)
  if client.name == "biome" then
    -- 使用系统命令调用 Biome lint
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup("biome_lint"),
      pattern = "*.js,*.ts,*.jsx,*.tsx,*.less,*.css,*.md", -- 修改为你需要的文件类型
      callback = function()
        vim.cmd("silent! !biome lint --write --unsafe " .. vim.fn.expand("%:p")) -- 调用 Biome 格式化
        vim.cmd("edit!") -- 重新加载文件
      end,
    })
  end
end)
