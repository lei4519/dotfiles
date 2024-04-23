local plugins = {
  { "wbthomason/packer.nvim" },
  -- 驼峰格式转换
  { 'arthurxavierx/vim-caser' },
  -- 增强文本对象
  { 'wellle/targets.vim' },
  -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
  { "antoinemadec/FixCursorHold.nvim" },
  {
    "rcarriga/nvim-notify",
    config = function()
      if #vim.api.nvim_list_uis() == 0 then
        -- no need to configure notifications in headless
        return
      end

      local notify = require "notify"

      notify.setup({
        active = false,
        on_config_done = nil,
        opts = {
          ---@usage Animation style one of { "fade", "slide", "fade_in_slide_out", "static" }
          stages = "slide",

          ---@usage Function called when a new window is opened, use for changing win settings/config
          on_open = nil,

          ---@usage Function called when a window is closed
          on_close = nil,

          ---@usage timeout for notifications in ms, default 5000
          timeout = 5000,

          -- Render function for notifications. See notify-render()
          render = "default",

          ---@usage highlight behind the window for stages that change opacity
          background_colour = "Normal",

          ---@usage minimum width for notification windows
          minimum_width = 50,

          ---@usage Icons for the different levels
          icons = {
            ERROR = "",
            WARN = "",
            INFO = "",
            DEBUG = "",
            TRACE = "✎",
          },
        },
      })
      vim.notify = notify
    end,
    requires = { "nvim-telescope/telescope.nvim" },
  },
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    config = function()
      require("bufferline").setup({
        options = {
          indicator_icon = "▎",
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",

          offsets = {
            {
              filetype = "undotree",
              text = "Undotree",
              highlight = "PanelHeading",
              padding = 1,
            },
            {
              filetype = "NvimTree",
              text = "Explorer",
              highlight = "PanelHeading",
              padding = 1,
            },
            {
              filetype = "DiffviewFiles",
              text = "Diff View",
              highlight = "PanelHeading",
              padding = 1,
            },
            {
              filetype = "flutterToolsOutline",
              text = "Flutter Outline",
              highlight = "PanelHeading",
            },
            {
              filetype = "packer",
              text = "Packer",
              highlight = "PanelHeading",
              padding = 1,
            },
          },
          diagnostics = "coc",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ""
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " " or (e == "warning" and " " or "")
              s = s .. sym .. n .. " "
            end
            return s
          end
        }
      })

    end
  },
  -- coc
  {
    'neoclide/coc.nvim',
    branch = 'release',
  },
  {
    'antoinemadec/coc-fzf',
    branch = 'release',
  },
  -- 主题
  {
    "folke/tokyonight.nvim", config = function()
      -- use("mhartington/oceanic-next")
      -- use("dracula/vim")
      -- use({
      --     "ellisonleao/gruvbox.nvim",
      --     requires = {"rktjmp/lush.nvim"}
      -- })
      -- -- use("glepnir/zephyr-nvim")
      -- use("shaunsingh/nord.nvim")
      -- use("ful1e5/onedark.nvim")
      -- use("EdenEast/nightfox.nvim")
      vim.o.background = "dark"
      vim.g.tokyonight_style = "storm" -- day / night
      -- 半透明
      vim.g.tokyonight_transparent = true
      vim.g.tokyonight_transparent_sidebar = true
      vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

      local colorscheme = "tokyonight"

      local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
      if not status_ok then
        vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
        return
      end
    end
  },
  {
    'glepnir/dashboard-nvim',
    config = function()
      -- Set header
      vim.g.dashboard_preview_command = 'cat'
      vim.g.dashboard_preview_pipeline = 'lolcat'
      vim.g.dashboard_preview_file = '~/.config/nvim/neovim.cat'
      vim.g.dashboard_preview_file_height = 20
      vim.g.dashboard_preview_file_width = 80
      -- Set menu
      vim.g.dashboard_custom_section = {
        a = { description = { "  Last Session    " }, command = "lua require('persistence').load({ last = true })" },
        b = { description = { "  Dir Session     " }, command = "lua require('persistence').load()" },
        c = { description = { "  Recent Projects " }, command = "CocList project" },
        d = { description = { "  Find File       " }, command = "CocList files" },
        e = { description = { "  New File        " }, command = "ene!" }
      }
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      -- https://github.com/nvim-lualine/lualine.nvim#screenshots
      local function evil_config()
        local lualine = require('lualine')

        -- Color table for highlights
        -- stylua: ignore
        local colors = {
          bg = '#202328',
          fg = '#bbc2cf',
          yellow = '#ECBE7B',
          cyan = '#008080',
          darkblue = '#081633',
          green = '#98be65',
          orange = '#FF8800',
          violet = '#a9a1e1',
          magenta = '#c678dd',
          blue = '#51afef',
          red = '#ec5f67'
        }

        local conditions = {
          buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
          end,
          hide_in_width = function()
            return vim.fn.winwidth(0) > 80
          end,
          check_git_workspace = function()
            local filepath = vim.fn.expand('%:p:h')
            local gitdir = vim.fn.finddir('.git', filepath .. ';')
            return gitdir and #gitdir > 0 and #gitdir < #filepath
          end
        }

        -- Config
        local config = {
          options = {
            -- Disable sections and component separators
            component_separators = '',
            section_separators = '',
            theme = {
              -- We are going to use lualine_c an lualine_x as left and
              -- right section. Both are highlighted by c theme .  So we
              -- are just setting default looks o statusline
              normal = {
                c = {
                  fg = colors.fg,
                  bg = colors.bg
                }
              },
              inactive = {
                c = {
                  fg = colors.fg,
                  bg = colors.bg
                }
              }
            }
          },
          extensions = {},
          sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            -- These will be filled later
            lualine_c = {},
            lualine_x = {}
          },
          inactive_sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {}
          }
        }

        -- Inserts a component in lualine_c at left section
        local function ins_left(component)
          table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x ot right section
        local function ins_right(component)
          table.insert(config.sections.lualine_x, component)
        end

        ins_left {
          function()
            -- return '▊'
            return ''
          end,
          color = {
            fg = colors.blue
          }, -- Sets highlighting of component
          padding = {
            left = 0,
            right = 1
          } -- We don't need space before this
        }

        ins_left {
          -- mode component
          function()
            -- auto change color according to neovims mode
            local s_map = {
              n = "n",
              i = "i",
              v = "v",
              V = "V",
              c = 'c',
              no = 'no',
              s = 's',
              S = 'S',
              ic = 'ic',
              R = 'R',
              Rv = 'Rv',
              cv = 'cv',
              ce = 'ce',
              r = 'r',
              rm = 'rm',
              ['r?'] = 'r?',
              ['!'] = '!',
              t = 't'
            }
            if s_map[vim.fn.mode()] ~= nil then
              return '  ' .. s_map[vim.fn.mode()]
            end
            return '  '
          end,
          color = function()
            -- auto change color according to neovims mode
            local mode_color = {
              n = colors.red,
              i = colors.green,
              v = colors.blue,
              [''] = colors.blue,
              V = colors.blue,
              c = colors.magenta,
              no = colors.red,
              s = colors.orange,
              S = colors.orange,
              [''] = colors.orange,
              ic = colors.yellow,
              R = colors.violet,
              Rv = colors.violet,
              cv = colors.red,
              ce = colors.red,
              r = colors.cyan,
              rm = colors.cyan,
              ['r?'] = colors.cyan,
              ['!'] = colors.red,
              t = colors.red
            }
            return {
              fg = mode_color[vim.fn.mode()]
            }
          end,
          padding = {
            right = 1
          }
        }

        ins_left {
          'g:coc_git_status', -- 分支
          color = {
            fg = colors.violet,
            gui = 'bold'
          },
          padding = {
            right = 1
          }
        }

        ins_left {
          'diff',
          -- Is it me or the symbol for modified us really weird
          symbols = {
            added = ' ',
            modified = '柳 ',
            removed = ' '
          },
          diff_color = {
            added = {
              fg = colors.green
            },
            modified = {
              fg = colors.orange
            },
            removed = {
              fg = colors.red
            }
          },
          cond = conditions.hide_in_width,
          padding = {
            right = 1
          }
        }

        ins_left { 'diagnostics' }

        ins_left {
          'filename',
          path = 1,
          file_status = true,
          cond = conditions.buffer_not_empty,
          color = {
            fg = colors.magenta,
            gui = 'bold'
          }
        }

        -- Insert mid section. You can make any number of sections in neovim :)
        -- for lualine it's any number greater then 2
        ins_left { function()
          return '%='
        end }

        ins_left {
          'g:coc_status',
          -- Lsp server name .
          function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
              return msg
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
          icon = ' ',
          color = {
            fg = '#ffffff',
            gui = 'bold'
          }
        }

        -- Add components to right sections
        ins_right {
          -- filesize component
          'filesize',
          cond = conditions.buffer_not_empty
        }

        ins_right {
          'filetype',
          colored = true, -- Displays filetype icon in color if set to true
          icon_only = true -- Display only an icon for filetype
        }

        ins_right {
          'o:encoding', -- option component same as &encoding in viml
          fmt = string.upper, -- I'm not sure why it's upper case either ;)
          cond = conditions.hide_in_width,
          color = {
            fg = colors.green,
            gui = 'bold'
          }
        }

        ins_right {
          'fileformat',
          fmt = string.upper,
          icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
          color = {
            fg = colors.green,
            gui = 'bold'
          }
        }

        ins_right { 'location' }

        ins_right {
          'progress',
          color = {
            fg = colors.fg,
            gui = 'bold'
          }
        }

        ins_right {
          function()
            -- return '▊'
            return ''
          end,
          color = {
            fg = colors.blue
          },
          padding = {
            left = 1
          }
        }

        -- Now don't forget to initialize lualine
        lualine.setup(config)
      end

      local function config()
        require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = {
              left = "|",
              right = "|"
            },
            -- https://github.com/ryanoasis/powerline-extra-symbols
            section_separators = {
              left = " ",
              right = ""
            },
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true
          },
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'g:coc_git_status', -- 分支
              {
                'diff',
                -- Is it me or the symbol for modified us really weird
                symbols = {
                  added = ' ',
                  modified = '柳 ',
                  removed = ' '
                }
              }, 'diagnostics' },
            lualine_c = { {
              'filename',
              file_status = true, -- Displays file status (readonly status, modified status)
              path = 1, -- 0: Just the filename
              separator = '',
              -- 1: Relative path
              -- 2: Absolute path
              -- shorting_target = 40, -- Shortens path to leave 40 spaces in the window
              -- for other components. (terrible name, any suggestions?)
              symbols = {
                modified = '[+]', -- Text to show when the file is modified.
                readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]' -- Text to show for unnamed buffers.
              }
            }, {
              '%=',
              separator = ''
            }, {
              'g:coc_status',
              -- Lsp server name .
              function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              icon = '',
              color = {
                -- fg = '#ffffff',
                gui = 'bold'
              }
            } },
            lualine_x = { 'filesize', {
              'encoding',
              fmt = string.upper
            }, {
              "fileformat",
              -- fmt = string.upper,
              -- icons_enabled = false
              symbols = {
                unix = "LF",
                dos = "CRLF",
                mac = "CR"
              }
            } },
            lualine_y = { {
              'filetype',
              colored = true, -- Displays filetype icon in color if set to true
              icon_only = false -- Display only an icon for filetype
            } },
            lualine_z = { 'progress', 'location' }
          }
        }
      end

      config()
    end
  },
  {
    "folke/which-key.nvim",
    event = "BufWinEnter",
    config = function()
      local wk = require("which-key")
      wk.setup()

      for _, cfg in ipairs(require("keymap")) do
        wk.register(cfg[2], cfg[1])
      end
    end
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      local nvim_comment = require "Comment"

      nvim_comment.setup()
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.3
          end
        end,
        start_in_insert = true
      })

      local Terminal = require("toggleterm.terminal").Terminal

      -- TODO
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double"
        },
        on_open = function(term)
          -- vim.cmd("startinsert!")
          -- q / <leader>tg 关闭 terminal
          -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {
          --   noremap = true,
          --   silent = true
          -- })
          -- ESC 键取消，留给lazygit
          -- if vim.fn.mapcheck("<Esc>", "t") ~= "" then
          --   vim.api.nvim_del_keymap("t", "<Esc>")
          -- end
        end,
        on_close = function(_)
          -- 添加回来
          -- vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {
          --   noremap = true,
          --   silent = true
          -- })
        end
      })

      local ta = Terminal:new({
        direction = "float",
        close_on_exit = true
      })

      local tb = Terminal:new({
        direction = "vertical",
        close_on_exit = true
      })

      local tc = Terminal:new({
        direction = "horizontal",
        close_on_exit = true
      })


      L.toggleA = function()
        if ta:is_open() then
          ta:close()
          return
        end
        tb:close()
        tc:close()
        ta:open()
      end

      L.toggleB = function()
        if tb:is_open() then
          tb:close()
          return
        end
        ta:close()
        tc:close()
        tb:open()
      end

      L.toggleC = function()
        if tc:is_open() then
          tc:close()
          return
        end
        ta:close()
        tb:close()
        tc:open()
      end

      L.toggleG = function()
        lazygit:toggle()
      end
    end
  },
  { 'junegunn/fzf' },
  {
    'junegunn/fzf.vim',
    event = "BufRead"
  },
  -- 搜索替换
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("spectre").setup({
        line_sep_start = '',
        result_padding = '  ',
        line_sep       = 'Mapping',
        mapping        = {
          ['send_to_qf'] = {
            map = "<C-q>",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix"
          },
          ['toggle_word'] = {
            map = "tw",
            cmd = "<cmd>lua require('spectre').change_options('word')<CR>",
            desc = "match word"
          },
        },
        find_engine    = {
          ['ag'] = {
            cmd = "ag",
            args = {
              '--vimgrep',
              '-s'
            },
            options = {
              ['word'] = {
                value = "-w",
                desc = "match word",
                icon = "[W]"
              },
              ['hidden'] = {
                value = "--hidden",
                desc = "hidden file",
                icon = "[H]"
              },
            },
          },
        },
        default        = {
          find = {
            cmd = "ag",
          },
        },
      })
    end,
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end
  },
  {
    "Pocco81/AutoSave.nvim",
    event = "BufRead",
    config = function()
      require("autosave").setup()
    end
  },
  -- 平滑滚动
  -- { "'psliwka/vim-smoothie'", event = "WinScrolled" },
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
  -- session 管理
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "data" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },
  -- vim-surround
  {
    "tpope/vim-surround",
    event = "BufRead",
    keys = { "c", "d", "y" }
  },
  -- 使 . 可以在全局重复
  { "tpope/vim-repeat" },
  -- preview markdown
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
    event = "BufRead",
  },
  -- open url with gx
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  -- 更好的 quickfix
  {
    'kevinhwang91/nvim-bqf',
    event = "BufRead",
    ft = 'qf'
  },
  -- lightspeed 光标快速跳转
  {
    "ggandor/lightspeed.nvim",
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
  },
  -- Debugger
  { 'puremourning/vimspector' },
}

-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", -- "https://github.com/wbthomason/packer.nvim",
    "https://github.com/wbthomason/packer.nvim", install_path })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    for _, v in ipairs(plugins) do
      use(v)
    end

    if packer_bootstrap then
      packer.sync()
    end
  end,
})
