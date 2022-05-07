local M = {}

function M.config()
  -- 光标移动到末尾时进入下一行
  lvim.line_wrap_cursor_movement = true

  -- -- 透明窗口
  lvim.transparent_window = true

end

return M
