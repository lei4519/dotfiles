local M = {}

local function config()
end

function M.setup()
  -- project
  -- https://github.com/ahmedkhalf/project.nvim
  -- use {"kevinhwang91/rnvimr", config = config}

  -- Additional Plugins
  lvim.plugins = {
    -- 主题
    { "folke/tokyonight.nvim" },
    -- ranger
    {
      "kevinhwang91/rnvimr",
      cmd = "RnvimrToggle",
      config = function()
        vim.g.rnvimr_draw_border = 1
        vim.g.rnvimr_pick_enable = 1
        vim.g.rnvimr_bw_enable = 1
      end
    },
    -- 自动保存
    {
      "Pocco81/AutoSave.nvim",
      disable = true,
      config = function()
        require("autosave").setup({
          enabled = true,
          execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
          events = {"InsertLeave"},
          conditions = {
              exists = true,
              filename_is_not = {},
              filetype_is_not = {},
              modifiable = true
          },
          clean_command_line_interval = 0,
          debounce_delay = 1000
      })
      end
    },
    -- 缩进线
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function()
        require('indent_blankline').setup({
          -- 空行占位
          space_char_blankline = " ",
          -- 用 treesitter 判断上下文
          show_current_context = true,
          show_current_context_start = true,
          context_patterns = { "class", "function", "method", "element", "^if", "^while", "^for", "^object", "^table",
            "block", "arguments" },
          -- echo &filetype
          filetype_exclude = { "null-ls-info", "dashboard", "packer", "terminal", "help", "log", "markdown",
            "TelescopePrompt", "lsp-installer", "lspinfo", "toggleterm" },
          -- 竖线样式
          -- char = '¦'
          -- char = '┆'
          -- char = '│'
          -- char = "⎸",
          char = "▏"
        })
      end
    },
    -- 平滑滚动
    {
      "karb94/neoscroll.nvim",
      -- neovide 不需要平滑滚动
      disable = vim.fn.exists('g:neovide'),
      event = "WinScrolled",
      config = function()
        require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
          hide_cursor = true, -- Hide cursor while scrolling
          stop_eof = true, -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil, -- Default easing function
          pre_hook = nil, -- Function to run before the scrolling animation starts
          post_hook = nil -- Function to run after the scrolling animation ends
        })
      end
    },
    -- 多光标
    {
      'mg979/vim-visual-multi',
      event = "BufRead",
      -- config = function()
      --   require("vim-multiple-cursors").setup()
      -- end
    },
    -- 打开文件时回到之前编辑的地方
    {
      "ethanholz/nvim-lastplace",
      event = "BufRead",
      config = function()
        require("nvim-lastplace").setup({
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
          lastplace_open_folds = true
        })
      end
    },
    -- 注释增强
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end
    },
    -- 光标单词下划线
    {
      "itchyny/vim-cursorword",
      event = { "BufEnter", "BufNewFile" },
      config = function()
        vim.api.nvim_command("augroup user_plugin_cursorword")
        vim.api.nvim_command("autocmd!")
        vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
        vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
        vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
        vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
        vim.api.nvim_command("augroup END")
      end
    },
    -- session 管理
    {
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require("persistence").setup {
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" }
        }
      end
    },
    -- vim-surround
    {
      "tpope/vim-surround",
      keys = { "c", "d", "y" }
      -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
      -- setup = function()
      --  vim.o.timeoutlen = 500
      -- end
    },
    -- 自动闭合标签
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup()
      end
    },
    -- 彩色括号
    { "p00f/nvim-ts-rainbow" },
    -- function 悬浮提示
    {
      "romgrk/nvim-treesitter-context",
      config = function()
        require("treesitter-context").setup {
          enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
          throttle = true, -- Throttles plugin updates (may improve performance)
          max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
          patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = { 'class', 'function', 'method' }
          }
        }
      end
    },
    -- telescope 插件：项目管理
    {
      "nvim-telescope/telescope-project.nvim",
      event = "BufWinEnter",
      setup = function()
        vim.cmd [[packadd telescope.nvim]]
      end
    },
    -- 函数参数文档提示
    {
      "ray-x/lsp_signature.nvim",
      -- event = "BufRead",
      config = function()
        require "lsp_signature".setup()
      end
      -- config = function() require"lsp_signature".on_attach() end,
    },
    -- 大纲
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline"
    },
    -- 更友好的诊断提示
    -- {
    --   "folke/trouble.nvim",
    --   cmd = "TroubleToggle"
    -- },
    -- 使 . 可以在全局重复
    { "tpope/vim-repeat" },
    -- 翻译
    {
      'voldikss/vim-translator',
      setup = function()
        vim.g.translator_default_engines = {'google', 'youdao'}
        vim.cmd([[
          nnoremap <silent><expr> <M-f> translator#window#float#has_scroll() ?
                            \ translator#window#float#scroll(1) : "\<M-f>"
          nnoremap <silent><expr> <M-b> translator#window#float#has_scroll() ?
                                      \ translator#window#float#scroll(0) : "\<M-f>"
        ]])
      end
    }
  }
end

return M
