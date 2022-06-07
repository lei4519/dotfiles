local M = {}

function M.config()
  local myAutoGroup = vim.api.nvim_create_augroup("Lay", {
    clear = true,
  })

  local autocmd = vim.api.nvim_create_autocmd

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

return M
