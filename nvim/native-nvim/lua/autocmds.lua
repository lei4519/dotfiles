local myAutoGroup = vim.api.nvim_create_augroup("Lay", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- -- nvim-tree 自动关闭
-- autocmd("BufEnter", {
--   nested = true,
--   group = myAutoGroup,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--       vim.api.nvim_command("quit")
--     end
--   end,
-- })

-- -- 进入Terminal 自动进入插入模式
-- autocmd("TermOpen", {
--   group = myAutoGroup,
--   command = "startinsert",
-- })

-- 使用回车换行时自动插入注释
autocmd("BufWinEnter", {
  group = myAutoGroup,
  command = "setlocal fo+=cro"
})

-- 切换输入法
autocmd("InsertEnter", {
  group = myAutoGroup,
  command = ":lua require'im-select'.InsertEnter()"
})

autocmd("InsertLeave", {
  group = myAutoGroup,
  command = ":lua require'im-select'.InsertLeave()"
})
