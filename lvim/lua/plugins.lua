local M = {}

function M.setup()
  -- project
  -- https://github.com/ahmedkhalf/project.nvim
  -- use {"kevinhwang91/rnvimr", config = config}

  -- Additional Plugins
  lvim.plugins = {
    -- 主题
    { "folke/tokyonight.nvim" },
    -- comment snip
    {
      "danymat/neogen",
      disable = false,
      config = function()
        require('neogen').setup({ snippet_engine = "luasnip" })
      end,
      requires = "nvim-treesitter/nvim-treesitter",
    },
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
      event = "BufRead",
      config = function()
        require("autosave").setup()
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
      event = "WinScrolled",
      config = function()
        require('neoscroll').setup({
          -- All these keys will be mapped to their corresponding default scrolling animation
          mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
            '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
          hide_cursor = true, -- Hide cursor while scrolling
          stop_eof = true, -- Stop at <EOF> when scrolling downwards
          use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
          respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
          cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
          easing_function = nil, -- Default easing function
          pre_hook = nil, -- Function to run before the scrolling animation starts
          post_hook = nil, -- Function to run after the scrolling animation ends
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
    {
      "nvim-telescope/telescope-fzy-native.nvim",
      run = "make",
      event = "BufRead",
    },
    -- 注释增强
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup({
          signs = true, -- show icons in the signs column
          sign_priority = 8, -- sign priority
          -- keywords recognized as todo comments
          keywords = {
            FIX = {
              icon = " ", -- icon used for the sign, and in search results
              color = "error", -- can be a hex color, or a named color (see below)
              alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
              -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = " ", color = "info" },
            HACK = { icon = " ", color = "warning" },
            WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
            PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          },
          merge_keywords = true, -- when true, custom keywords will be merged with the defaults
          -- highlighting of the line containing the todo comment
          -- * before: highlights before the keyword (typically comment characters)
          -- * keyword: highlights of the keyword
          -- * after: highlights after the keyword (todo text)
          highlight = {
            before = "", -- "fg" or "bg" or empty
            keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
            after = "fg", -- "fg" or "bg" or empty
            pattern = [[.*<(KEYWORDS)(\s*|:)]], -- pattern or table of patterns, used for highlightng (vim regex)
            comments_only = true, -- uses treesitter to match keywords in comments only
            max_line_len = 400, -- ignore lines longer than this
            exclude = {}, -- list of file types to exclude highlighting
          },
          -- list of named colors where we try to extract the guifg from the
          -- list of hilight groups or use the hex color if hl not found as a fallback
          colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
          },
          search = {
            command = "rg",
            args = {
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
            },
            -- regex that will be used to match keywords.
            -- don't replace the (KEYWORDS) placeholder
            pattern = [[\b(KEYWORDS)(\s*|:)]], -- ripgrep regex
            -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
          },
        })
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
        require("persistence").setup({
          dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
          options = { "buffers", "curdir", "tabpages", "winsize" }
        })
      end
    },
    -- vim-surround
    {
      "tpope/vim-surround",
      event = "BufRead",
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
    {
      "p00f/nvim-ts-rainbow",
      event = "BufRead",
    },
    -- function 悬浮提示
    {
      "romgrk/nvim-treesitter-context",
      event = "BufRead",
      config = function()
        require("treesitter-context").setup({
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
        })
      end
    },
    -- telescope 插件：项目管理
    {
      "nvim-telescope/telescope-project.nvim",
      event = "BufWinEnter",
    },
    -- 函数参数文档提示
    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function()
        require "lsp_signature".setup()
      end
      -- config = function() require"lsp_signature".on_attach() end,
    },
    -- 颜色高亮
    {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("colorizer").setup({ "*" }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
      end,
    },
    -- 大纲
    {
      "simrat39/symbols-outline.nvim",
      event = "BufRead",
      cmd = "SymbolsOutline"
    },
    -- 更友好的诊断提示
    {
      "folke/trouble.nvim",
      event = "BufRead",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    },
    -- 使 . 可以在全局重复
    { "tpope/vim-repeat" },
    -- 翻译
    {
      'voldikss/vim-translator',
      event = "BufRead",
      config = function()
        vim.g.translator_default_engines = { 'google', 'youdao' }
      end
    },
    -- preview markdown
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
      event = "BufRead",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },
    -- open url with gx
    {
      "felipec/vim-sanegx",
      event = "BufRead",
    },
    -- preview 增强
    {
      'rmagatti/goto-preview',
      event = "BufRead",
      config = function()
        require('goto-preview').setup { height = 30 }
      end
    },
    -- 更好的 quickfix
    {
      'kevinhwang91/nvim-bqf',
      event = "BufRead",
      ft = 'qf'
    },
    -- 原始的 grep
    {
      disable = true,
      event = "BufRead",
      'nvim-telescope/telescope-live-grep-raw.nvim',
    },
    -- telescope ui 增强
    {
      'nvim-telescope/telescope-ui-select.nvim',
    },
    -- lightspeed 光标快速跳转
    {
      "ggandor/lightspeed.nvim",
      event = "BufRead",
      -- config = function()
      --   require 'lightspeed'.setup()
      -- end
    },
    -- ts 增强：重命名文件、导入等
    {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      event = "BufRead",
      requires = "nvim-lua/plenary.nvim"
    },
    -- rust 增强
    {
      "simrat39/rust-tools.nvim",
      event = "BufRead",
      config = function()
        local lsp_installer_servers = require "nvim-lsp-installer.servers"
        local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"
        require("rust-tools").setup({
          tools = {
            autoSetHints = true,
            hover_with_actions = true,
            runnables = {
              use_telescope = true,
            },
            inlay_hints = {
              show_variable_name = true,
              -- prefix for parameter hints
              -- default: "<-"
              parameter_hints_prefix = " ",
              -- prefix for all the other hints (type, chaining)
              -- default: "=>"
              other_hints_prefix = " ",
            }
          },
          server = {
            cmd_env = requested_server._default_options.cmd_env,
            on_attach = require("lvim.lsp").common_on_attach,
            on_init = require("lvim.lsp").common_on_init,
          },
        })
      end,
      ft = { "rust", "rs" },
    },
    -- 增强%
    {
      'andymass/vim-matchup',
      event = "BufRead",
    },
    -- 对齐
    {
      'junegunn/vim-easy-align',
      event = "BufRead"
    },
    -- 显示mark
    {
      'kshenoy/vim-signature',
      event = "BufRead"
    }
  }
end

return M
