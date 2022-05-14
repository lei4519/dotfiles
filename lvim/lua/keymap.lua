local M = {}

function M.config()
  -- treesitter 折叠
  -- lvim.keys.normal_mode['zc'] = ":foldclose<CR>"
  -- lvim.keys.normal_mode['zo'] = ":foldopen<CR>"
  lvim.keys.normal_mode = {
    -- Resize with arrows
    ["<C-Up>"] = ":resize -2<CR>",
    ["<C-Down>"] = ":resize +2<CR>",
    ["<C-Left>"] = ":vertical resize -2<CR>",
    ["<C-Right>"] = ":vertical resize +2<CR>",

    -- Tab switch buffer
    ["<C-l>"] = ":BufferLineCycleNext<CR>",
    ["<C-h>"] = ":BufferLineCyclePrev<CR>",

    -- Move current line / block with Alt-j/k a la vscode.
    ["<A-j>"] = ":m .+1<CR>==",
    ["<A-k>"] = ":m .-2<CR>==",

    -- QuickFix
    ["]q"] = ":cnext<CR>",
    ["[q"] = ":cprev<CR>",
    ["<C-q>"] = ":call QuickFixToggle()<CR>",
  }

  lvim.keys.insert_mode = {
    -- 'jk' for quitting insert mode
    ["jf"] = "<ESC>",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    -- navigation
    ["<A-Up>"] = "<C-\\><C-N><C-w>k",
    ["<A-Down>"] = "<C-\\><C-N><C-w>j",
    ["<A-Left>"] = "<C-\\><C-N><C-w>h",
    ["<A-Right>"] = "<C-\\><C-N><C-w>l",
  }

  -- 保存全部
  -- lvim.builtin.which_key.mappings['s'] = { "<cmd>wa!<CR>", "Save All" }

  -- 窗口跳转
  lvim.builtin.which_key.mappings["h"] = { "<C-w>h", "Move Right Window" }
  lvim.builtin.which_key.mappings["j"] = { "<C-w>j", "Move Down Window" }
  lvim.builtin.which_key.mappings["k"] = { "<C-w>k", "Move Up Window" }
  lvim.builtin.which_key.mappings["l"] = { "<C-w>l", "Move Left Window" }

  -- 映射 telescope C-j C-k 上下选择 C-n C-p 历史切换
  local telescope_actions = require "telescope.actions"
  lvim.builtin.telescope.defaults.mappings = {
    i = {
      ["<C-j>"] = telescope_actions.move_selection_next,
      ["<C-k>"] = telescope_actions.move_selection_previous,
      ["<C-n>"] = telescope_actions.cycle_history_next,
      ["<C-p>"] = telescope_actions.cycle_history_prev,
    },
  }

  -- 回车补全
  local cmp = require "cmp"
  lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  })

  -- 目录树
  lvim.builtin.nvimtree.setup.view.mappings.list = {
    { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
    -- { key = "h", action = "close_node" },
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    { key = "i", action = "toggle_ignored" },
    -- Hide (dotfiles)
    { key = ".", action = "toggle_dotfiles" },
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    -- 进入下一级
    { key = { "]" }, action = "cd" },
    -- 进入上一级
    -- { key = { "[" }, action = "dir_up" },
    { key = { "[" }, action = "cd .." },
    { key = "f", action = "telescope_find_files", action_cb = function()
      require("lvim.core.nvimtree").start_telescope "find_files"
    end },
    { key = "g", action = "telescope_live_grep", action_cb = function()
      require("lvim.core.nvimtree").start_telescope "live_grep"
    end },
  }

  -- 两次空格取消高亮
  lvim.builtin.which_key.mappings["<space>"] = { "<cmd>nohlsearch<CR>", "No Highlight" }

  -- bufferline
  lvim.builtin.which_key.mappings["bo"] = { ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", "Close Other" }

  -- SymbolOutLine
  lvim.builtin.which_key.mappings['o'] = { ":SymbolsOutline<cr>", "Symbols Outline" }

  -- 悬浮终端
  lvim.builtin.terminal.open_mapping = nil
  lvim.builtin.which_key.mappings['t'] = {
    t = { "<cmd>ToggleTerm<cr>", "ToggleTerm" },
    w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
    d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
    l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
    r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  }
  lvim.builtin.terminal.execs = { { "lazygit", "<leader>tg", "LazyGit", "float" } }
  function set_terminal_mode_tt_keymap()
    vim.api.nvim_buf_set_keymap(0, 't', '<leader>tt', [[<cmd>ToggleTerm<cr>]], { noremap = true })
  end

  vim.cmd('autocmd! TermOpen term://* lua set_terminal_mode_tt_keymap()')

  -- 翻译
  vim.api.nvim_set_keymap('v', '<C-t>', ':Translate<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<C-t>', ':Translate<CR>', { noremap = true, silent = true })

  -- 窗口管理
  lvim.builtin.which_key.mappings['w'] = {
    name = "Window & Workspace",
    v = { ":vsp<cr>", "Split Vertical" },
    h = { ":sp<cr>", "Split Horizontal" },
    c = { "<c-w>c", "Close current" },
    o = { "<c-w>o", "Close Other" },
    ['='] = { "<c-w>=", "Change Average" },
    -- vim 工作区管理
    a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
    r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Workspace Folder" },
    l = { "<cmd>lua vim.lsp.buf.list_workspace_folders()<CR>", "List Workspace Folder" }
  }

  -- 搜索
  lvim.builtin.which_key.mappings["f"] = {
    name = "Telescope",
    -- f = { "<cmd>telescope find_files<cr>", "find_files" },
    -- lunarvim 的配置，在 git repo 中使用 git_files，否则使用 fine_files
    a = { "<cmd>Telescope<cr>", "Telescope" },
    -- bufferline 已经够用了
    -- b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    d = {
      name = "Diagnostics",
      b = { "<cmd>Trouble document_diagnostics<cr>", "Buffer Diagnostics" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    },
    -- 搜索文件: file or git file
    f = lvim.builtin.which_key.mappings["f"],
    F = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Fuzzy Find" },
    -- g = { ":lua require('telescope').extensions.live_grep_raw.live_grep_raw()<cr>", "Live Grep Raw" },
    g = { "<cmd>Telescope live_grep<cr>", "live_grep" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    o = { "<cmd>Telescope oldfiles<cr>", "Oldfiles" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    t = { "<cmd>TodoTelescope<cr>", "Todo" },
  }

  -- 目录管理
  lvim.builtin.which_key.mappings["r"] = {
    "<cmd>RnvimrToggle<CR>", "ranger"
  }

  -- session 管理
  lvim.builtin.which_key.mappings["S"] = {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  }

  -- Lsp 快捷键
  lvim.lsp.on_attach_callback = function(client, bufnr)
    if client.name == 'tsserver' then
      -- 禁用格式化功能，交给专门插件插件处理
      -- client.resolved_capabilities.document_formatting = false
      -- client.resolved_capabilities.document_range_formatting = false
      local ts_utils = require("nvim-lsp-ts-utils")
      -- defaults
      ts_utils.setup({
        debug = false,
        disable_commands = false,
        enable_import_on_completion = false,
        -- import all
        import_all_timeout = 5000, -- ms
        -- lower numbers = higher priority
        import_all_priorities = {
          same_file = 1, -- add to existing import statement
          local_files = 2, -- git files or files with relative path markers
          buffer_content = 3, -- loaded buffer content
          buffers = 4, -- loaded buffer names
        },
        import_all_scan_buffers = 100,
        import_all_select_source = false,
        -- if false will avoid organizing imports
        always_organize_imports = true,

        -- filter diagnostics
        filter_out_diagnostics_by_severity = {},
        filter_out_diagnostics_by_code = {},

        -- inlay hints
        auto_inlay_hints = true,
        inlay_hints_highlight = "Comment",
        inlay_hints_priority = 200, -- priority of the hint extmarks
        inlay_hints_throttle = 150, -- throttle the inlay hint request
        inlay_hints_format = { -- format options for individual hint kind
          Type = {},
          Parameter = {},
          Enum = {},
          -- Example format customization for `Type` kind:
          -- Type = {
          --     highlight = "Comment",
          --     text = function(text)
          --         return "->" .. text:sub(2)
          --     end,
          -- },
        },
        -- update imports on file move
        update_imports_on_move = false,
        require_confirmation_on_move = false,
        watch_dir = nil,
      })

      -- required to fix code action ranges and filter diagnostics
      ts_utils.setup_client(client)
    end
  end


  lvim.lsp.buffer_mappings.visual_mode = {
    ['ge'] = { ":EasyAlign<cr>", "Easy Align" }
  }
  lvim.lsp.buffer_mappings.normal_mode = {
    -- ["[q"] = ":cprev<CR>", QuickFix
    -- ["]q"] = ":cnext<CR>", QuickFix
    ["[d"] = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic" },
    ["ga"] = { vim.lsp.buf.code_action, "Code Action" },
    ['ge'] = { ":EasyAlign<cr>", "Easy Align" },
    ["gd"] = { vim.lsp.buf.definition, "Goto Definition" },
    ["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
    ["gf"] = {
      name = "Format",
      ['f'] = { require("lvim.lsp.utils").format, "Lsp Format" },
      ['e'] = { ":EslintFixAll<cr>", "EslintFixAll" }
    },
    ["gh"] = { vim.lsp.buf.hover, "Show Doc" },
    ["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" },
    ["gl"] = {
      function()
        local config = lvim.lsp.diagnostics.float
        config.scope = "line"
        vim.diagnostic.open_float(0, config)
      end,
      "Show line diagnostics",
    },
    ['gL'] = { vim.lsp.codelens.run, "CodeLens Action" },
    ['gp'] = {
      name = "Preview",
      d = {
        "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
        "Peek Definition",
      },
      i = {
        "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        "Preview Implementation",
      },
      r = {
        "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
        "Preview References",
      },
      t = {
        function()
          require("lvim.lsp.peek").Peek "typeDefinition"
        end,
        "Type Definition",
      },
      m = {
        "<cmd>MarkdownPreviewToggle<CR>",
        "Markdown Preview Toggle",
      },
    },
    ['gP'] = {
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      "Close All Preview",
    },
    ['gq'] = { vim.diagnostic.setloclist, "Quickfix" },
    ["gr"] = { vim.lsp.buf.rename, "Rename" },
    ["gs"] = { vim.lsp.buf.signature_help, "show signature help" },
    ["gt"] = { vim.lsp.buf.type_definition, "Goto Type Definition" },
    ["gT"] = {
      name = "TSLsp",
      o = { ":TSLspOrganize<CR>", "TSLsp Organize" },
      r = { ":TSLspRenameFile<CR>", "TSLsp Rename File" },
      i = { ":TSLspImportAll<CR>", "TSLsp Import All" },
    },
  }
end

return M
