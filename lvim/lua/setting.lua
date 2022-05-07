local M = {}

function M.config()
  -- 命令行矮一点
  vim.opt.cmdheight = 1

  -- 光标移动到末尾时进入下一行
  lvim.line_wrap_cursor_movement = true
  -- 透明窗口
  lvim.transparent_window = true

  -- lsp peek 窗口
  lvim.lsp.peek = {
    max_height = 300,
    max_width = 500,
    context = 10,
  }

  -- Dashboard
  lvim.builtin.alpha.dashboard.section.buttons = {
    entries = {
      { "SPC S l", "  Last Session", "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
      { "SPC S c", "  Dir Session", "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
      { "SPC f p", "  Recent Projects ", "<CMD>Telescope projects<CR>" },
      { "SPC f o", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>" },
      { "SPC f f", "  Find File", "<CMD>Telescope find_files<CR>" },
      { "SPC f g", "  Find Word", "<CMD>Telescope live_grep<CR>" },
      { "SPC n", "  New File", "<CMD>ene!<CR>" },
      {
        "SPC L c",
        "  Configuration",
        "<CMD>edit " .. require("lvim.config").get_user_config_path() .. " <CR>",
      },
    }
  }
  lvim.builtin.alpha.dashboard.section.footer = nil
end

return M
