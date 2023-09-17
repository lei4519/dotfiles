local M = {}

function M.config()
  -- general
  lvim.log.level = "warn"

  lvim.colorscheme = "tokyonight"

  lvim.leader = "space"

  lvim.builtin.alpha.active = true
  lvim.builtin.alpha.mode = "dashboard"
  lvim.builtin.notify.active = true

  -- lvim.builtin.nvimtree.setup.view.side = "left"
  -- lvim.builtin.nvimtree.show_icons.git = 0

  lvim.builtin.terminal.active = true
  lvim.builtin.dap.active = true

  lvim.builtin.treesitter.highlight.enabled = true
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
    "svelte"
  }

  -- treesitter
  -- nvim-treesitter-textobjects
  lvim.builtin.treesitter.textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  }
  lvim.builtin.treesitter.incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  }
  lvim.builtin.treesitter.autotag.enable = true

  -- 注释配置
  lvim.builtin.comment.mappings.extra = true

  -- rust 增强配置
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

  -- 相对行号
  vim.opt.relativenumber = true -- set relative numbered lines

  -- 命令行矮一点
  vim.opt.cmdheight = 1

  -- 光标移动到末尾时进入下一行
  lvim.line_wrap_cursor_movement = true

  -- 透明窗口
  lvim.transparent_window = true

  -- 折叠
  vim.opt.foldmethod = "indent" -- folding set to "expr" for treesitter based folding
  -- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  -- 默认不要折叠
  -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
  vim.opt.foldlevel = 99

  -- lualine 文件名显示路径
  require("lvim.core.lualine.components").filename.path = 1

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

  -- eslint 语言服务
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
  -- vim.api.nvim_command("autocmd BufEnter *.tsx,*.ts,*.jsx,*.js lua require('lvim.core.autocmds').disable_format_on_save()")
  -- vim.api.nvim_command("autocmd BufLeave *.tsx,*.ts,*.jsx,*.js lua require('lvim.core.autocmds').enable_format_on_save()")
  vim.api.nvim_command("autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll")
  require("lvim.lsp.manager").setup("eslint", {})

  lvim.lsp.on_attach_callback = function(client, bufnr)
    if client.name == 'tsserver' then
      -- 禁用格式化功能，交给 eslint 处理
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      local ts_utils = require("nvim-lsp-ts-utils")
      -- defaults
      ts_utils.setup {}

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)
    end

    local map = vim.api.nvim_buf_set_keymap
    -- lspsaga 弹窗滚动
    map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
    map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})

  end
end

return M
