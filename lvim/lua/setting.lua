local M = {}

function M.config()
  -- 相对行号
  vim.opt.relativenumber = true -- set relative numbered lines

  -- 命令行矮一点
  vim.opt.cmdheight = 1

  -- 光标移动到末尾时进入下一行
  lvim.line_wrap_cursor_movement = true
  -- 透明窗口
  lvim.transparent_window = true

  -- 折叠
  vim.opt.foldmethod = "expr" -- folding set to "expr" for treesitter based folding
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  -- 默认不要折叠
  -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
  vim.opt.foldlevel = 99

  -- lsp peek 窗口
  -- lvim.lsp.peek = {
  --   max_height = 300,
  --   max_width = 500,
  --   context = 10,
  -- }

  -- treesitter
  -- lvim.builtin.treesitter.autotag.enable = true
  lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  }

  -- 注释配置
  lvim.builtin.comment.mappings.extra = true

  -- Dashboard
  lvim.builtin.alpha.dashboard.section.buttons = {
    entries = {
      { "SPC S l", "  Last Session", "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
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

  -- eslint 语言服务
  require("lvim.lsp.manager").setup("eslint", {})

  -- Telescope UI 增强
  lvim.builtin.telescope.on_config_done = function (telescope)
    telescope.extensions["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
    telescope.load_extension("ui-select")
  end
end

return M
