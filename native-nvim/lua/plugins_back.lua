local coc_disable_plugins = {
  -- 增强%
  {
    'andymass/vim-matchup',
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
  {
    "lewis6991/gitsigns.nvim",
    disable = coc_enabel,
    config = function()
      require "gitsigns".setup {
        signs = {
          add = {
            hl = "GitSignsAdd",
            text = "▎",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
          change = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = "契",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = "▎",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
        },
        current_line_blame_formatter_opts = {
          relative_time = false,
        },
        preview_config = {
          -- Options passed to nvim_open_win
          border = "rounded",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        update_debounce = 200,
      }
    end,
    event = "BufRead",
  },
  -- 大纲
  {
    "simrat39/symbols-outline.nvim",
    disable = coc_enabel,
    event = "BufRead",
    cmd = "SymbolsOutline"
  },

  -- ts 增强：重命名文件、导入等
  {
    disable = coc_enabel,
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    event = "BufRead",
    requires = "nvim-lua/plenary.nvim"
  },
  -- rust 增强
  {
    disable = coc_enabel,
    "simrat39/rust-tools.nvim",
    event = "BufRead",
    config = function()
      local lsp_installer_servers = require "nvim-lsp-installer.servers"
      local _, requested_server = lsp_installer_servers.get_server "rust_analyzer"

      local extension_path = DAP_INSTALL .. "codelldb/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

      require("rust-tools").setup({
        dap = {
          adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
        },
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
  -- 更友好的诊断提示
  {
    "folke/trouble.nvim",
    disable = coc_enabel,
    event = "BufRead",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },
  -- 自动闭合标签
  {
    "windwp/nvim-ts-autotag",
    disable = coc_enabel,
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  -- 彩色括号
  {
    "p00f/nvim-ts-rainbow",
    disable = coc_enabel,
    event = "BufRead",
  },
  -- function 悬浮提示
  {
    "romgrk/nvim-treesitter-context",
    disable = coc_enabel,
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
  -- 函数参数文档提示
  {
    "ray-x/lsp_signature.nvim",
    disable = coc_enabel,
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
    -- config = function() require"lsp_signature".on_attach() end,
  },
  -- 颜色高亮
  {
    "norcalli/nvim-colorizer.lua",
    disable = coc_enabel,
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

  -- 光标单词下划线
  {
    "itchyny/vim-cursorword",
    disable = coc_enabel,
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
  {
    "lukas-reineke/indent-blankline.nvim",
    disable = coc_enabel,
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
  {
    "nvim-telescope/telescope.nvim",
    disable = coc_enabel,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-project.nvim"
    },
    configa = function()
      local telescope = require "telescope"
      -- load extensions
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.75,
            preview_cutoff = 120,
            horizontal = {
              preview_width = function(_, cols, _)
                if cols < 120 then
                  return math.floor(cols * 0.5)
                end
                return math.floor(cols * 0.6)
              end,
              mirror = false,
            },
            vertical = { mirror = false },
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
          },
          -- 窗口内快捷键
          mappings = {
            i = {
              -- 上下移动
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
              -- 历史记录
              ["<C-n>"] = "cycle_history_next",
              ["<C-p>"] = "cycle_history_prev",
              -- 关闭窗口
              -- ["<esc>"] = actions.close,
              ["<C-c>"] = "close",
              -- 预览窗口上下滚动
              ["<C-u>"] = "preview_scrolling_up",
              ["<C-d>"] = "preview_scrolling_down",
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
          file_ignore_patterns = {},
          path_display = { shorten = 5 },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          pickers = {
            find_files = {
              find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
            },
            live_grep = {
              --@usage don't include the filename in the search results
              only_sort_text = true,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown" -- 可选参数： dropdown, cursor, ivy
          }
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          ["ui-select"] = { require("telescope.themes").get_dropdown({
            -- even more opts
          }) }
        }
      })

      local extensions = { "ui-select", "fzf", "project" }

      for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
      end

    end
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    disable = coc_enabel,
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
  },
  {
    "ahmedkhalf/project.nvim",
    disable = coc_enabel,
    config = function()
      local project = require "project_nvim"

      project.setup()
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    disable = coc_enabel,
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim_tree").setup({})
      -- require("nvim_tree").setup({
      --   update_cwd = true,
      --   update_focused_file = { enable = true, update_cwd = true },
      --   -- 隐藏 .文件 和 node_modules 文件夹
      --   filters = {
      --     dotfiles = false
      --     -- custom = { "node_modules", "target" },
      --   },
      --   view = {
      --     -- 自定义列表中快捷键
      --     mappings = {
      --       custom_only = true,
      --       list = {
      --         { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
      --         { key = "<C-e>", action = "edit_in_place" },
      --         { key = { "O" }, action = "edit_no_picker" },
      --         { key = "]", action = "cd" },
      --         { key = "[", action = "dir_up" },
      --         { key = "<C-v>", action = "vsplit" },
      --         { key = "<C-x>", action = "split" },
      --         { key = "<C-t>", action = "tabnew" },
      --         { key = "<", action = "prev_sibling" },
      --         { key = ">", action = "next_sibling" },
      --         { key = "P", action = "parent_node" },
      --         { key = "<BS>", action = "close_node" },
      --         { key = "<Tab>", action = "preview" },
      --         { key = "K", action = "first_sibling" },
      --         { key = "J", action = "last_sibling" },
      --         { key = "I", action = "toggle_git_ignored" },
      --         { key = "H", action = "toggle_dotfiles" },
      --         { key = "R", action = "refresh" },
      --         { key = "a", action = "create" },
      --         { key = "d", action = "remove" },
      --         { key = "D", action = "trash" },
      --         { key = "r", action = "rename" },
      --         { key = "<C-r>", action = "full_rename" },
      --         { key = "x", action = "cut" },
      --         { key = "c", action = "copy" },
      --         { key = "p", action = "paste" },
      --         { key = "y", action = "copy_name" },
      --         { key = "Y", action = "copy_path" },
      --         { key = "gy", action = "copy_absolute_path" },
      --         { key = "[c", action = "prev_git_item" },
      --         { key = "]c", action = "next_git_item" },
      --         { key = "s", action = "system_open" },
      --         { key = "f", action = "live_filter" },
      --         { key = "F", action = "clear_live_filter" },
      --         { key = "q", action = "close" },
      --         { key = "g?", action = "toggle_help" },
      --         { key = "W", action = "collapse_all" },
      --         { key = "S", action = "search_node" },
      --         { key = "<C-k>", action = "toggle_file_info" },
      --         { key = ".", action = "run_file_command" }
      --       }
      --     },
      --   },
      -- })
    end
  }

}
