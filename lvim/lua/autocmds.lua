local M = {}

local myAutoGroup = vim.api.nvim_create_augroup("Lay", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

function M.config()

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
end

function M.autocmd(event,  pattern, command)
  autocmd(event, {
    group = myAutoGroup,
    pattern = pattern,
    command = command
  })
end

return M
