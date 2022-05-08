local M = {}

function M.config()
  -- treesitter 折叠
  lvim.keys.normal_mode['zc'] = ":foldclose<CR>"
  lvim.keys.normal_mode['zo'] = ":foldopen<CR>"

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

  -- 注释配置
  lvim.builtin.comment.mappings.extra = true

  -- 两次空格取消高亮
  lvim.builtin.which_key.mappings["<space>"] = { "<cmd>nohlsearch<CR>", "No Highlight" }

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

  -- 悬浮终端
  lvim.builtin.terminal.open_mapping = nil
  lvim.builtin.which_key.mappings['tt'] = { "<cmd>ToggleTerm<cr>", "ToggleTerm" }
  lvim.builtin.terminal.execs = { { "lazygit", "<leader>tg", "LazyGit", "float" } }
  require("lvim.keymappings").load {
    term_mode = { ['<leader>tt'] = "<cmd>lua require('lvim.core.terminal')._exec_toggle()<CR>" },
  }
  function set_terminal_mode_tt_keymap()
    vim.api.nvim_buf_set_keymap(0, 't', '<leader>tt', [[<cmd>ToggleTerm<cr>]], { noremap = true })
  end

  vim.cmd('autocmd! TermOpen term://* lua set_terminal_mode_tt_keymap()')

  -- 翻译
  lvim.builtin.which_key.mappings['tw'] = { "<cmd>TranslateW<CR>", "Translate Window" }
  lvim.builtin.which_key.vmappings['tw'] = { "<cmd>TranslateW<CR>", "Translate Window" }
  lvim.builtin.which_key.mappings['tr'] = { "<cmd>TranslateR<CR>", "Translate Replace" }
  lvim.builtin.which_key.vmappings['tr'] = { "<cmd>TranslateR<CR>", "Translate Replace" }
  lvim.builtin.which_key.mappings['ty'] = { "<cmd>TranslateX<CR>", "Translate Yank" }

  -- 保存全部
  lvim.builtin.which_key.mappings['s'] = { "<cmd>wa!<CR>", "Save All" }

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

  -- 窗口跳转
  lvim.builtin.which_key.mappings["h"] = { "<C-w>h", "Move Right Window" }
  lvim.builtin.which_key.mappings["j"] = { "<C-w>j", "Move Down Window" }
  lvim.builtin.which_key.mappings["k"] = { "<C-w>k", "Move Up Window" }
  lvim.builtin.which_key.mappings["l"] = { "<C-w>l", "Move Left Window" }

  -- 搜索
  lvim.builtin.which_key.mappings["f"] = {
    name = "Telescope",
    -- f = { "<cmd>telescope find_files<cr>", "find_files" },
    -- lunarvim 的配置，在 git repo 中使用 git_files，否则使用 fine_files
    f = lvim.builtin.which_key.mappings["f"],
    g = { "<cmd>Telescope live_grep<cr>", "Live_grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    o = { "<cmd>Telescope oldfiles<cr>", "Oldfiles" },
    q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    t = { "<cmd>TodoTelescope<cr>", "Todo" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  }
  -- 映射 telescope C-j C-k 上下选择 C-n C-p 历史切换
  local telescope_actions = require "telescope.actions"
  lvim.builtin.telescope.defaults.mappings = {
    i = {
      ["<C-j>"] = telescope_actions.move_selection_next,
      ["<C-k>"] = telescope_actions.move_selection_previous,
      ["<C-n>"] = telescope_actions.cycle_history_next,
      ["<C-p>"] = telescope_actions.cycle_history_prev,
    }
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

  -- Lsp 快捷键
  lvim.lsp.on_attach_callback = function(client, bufnr)
    local map = vim.api.nvim_buf_set_keymap
    -- lspsaga 弹窗滚动
    map(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
    map(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
  end
  lvim.builtin.which_key.vmappings['ga'] = { ":<C-U>Lspsaga range_code_action<CR>", "Range Code Action" }
  lvim.lsp.buffer_mappings.normal_mode = {
    -- ["[q"] = ":cprev<CR>", QuickFix
    -- ["]q"] = ":cnext<CR>", QuickFix
    ["[d"] = { ":Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostic" },
    ["]d"] = { ":Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
    ["gd"] = { ":Lspsaga lsp_finder<CR>", "Show Definition & Reference" },
    ["ga"] = { ":Lspsaga code_action<CR>", "Code Action" },
    ["gs"] = { ":Lspsaga signature_help<CR>", "Show Signature Help" },
    ["gr"] = { ':Lspsaga rename<CR>', "Rename" },
    ["gh"] = { ":Lspsaga hover_doc<CR>", "Show Doc" },
    ["gl"] = {
      ":Lspsaga show_line_diagnostics<CR>",
      "Show line diagnostics",
    },
    ['gq'] = { vim.diagnostic.setloclist, "Quickfix" },
    ["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" },
    ["gt"] = { vim.lsp.buf.type_definition, "Goto Type Definition" },
    ["gf"] = { require("lvim.lsp.utils").format, "Format" },
    -- 注释使用了
    -- ['gca'] = { vim.lsp.codelens.run, "CodeLens Action" },
    ["gpd"] = {
      "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
      "Peek Definition",
    },
    ['gpi'] = {
      "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
      "Preview Implementation",
    },
    ['gpr'] = {
      "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
      "Preview References",
    },
    ['gP'] = {
      "<cmd>lua require('goto-preview').close_all_win()<CR>",
      "Close All Preview",
    },
    ['gpt'] = {
      function()
        require("lvim.lsp.peek").Peek "typeDefinition"
      end,
      "Type Definition",
    },
  }

end

return M
