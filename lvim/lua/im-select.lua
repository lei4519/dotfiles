local M = {}

M.defaultIM = "com.apple.keylayout.ABC"
-- M.defaultIM = "com.apple.inputmethod.SCIM.Shuangpin"
M.currentIM = M.defaultIM

M.InsertLeave = function()
  M.currentIM = vim.fn.system({ "im-select" })
  vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
end

M.InsertEnter = function()
  if M.currentIM then
    vim.cmd(":silent :!im-select" .. " " .. M.currentIM)
  else
    vim.cmd(":silent :!im-select" .. " " .. M.defaultIM)
  end
end

return M
