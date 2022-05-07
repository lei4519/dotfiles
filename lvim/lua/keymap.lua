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

  -- 项目管理
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
  lvim.builtin.terminal.open_mapping = "<leader>tt"
  lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs + 1] = { "lazygit", "<leader>tg", "LazyGit", "float" }
  lvim.builtin.which_key.mappings['tw'] = {"<cmd>TranslateW<CR>", "Translate Window"}
  lvim.builtin.which_key.vmappings['tw'] = {"<cmd>TranslateWV<CR>", "Translate Window"}
  lvim.builtin.which_key.mappings['tr'] = {"<cmd>TranslateR<CR>", "Translate Replace"}
  lvim.builtin.which_key.vmappings['tr'] = {"<cmd>TranslateRV<CR>", "Translate Replace"}
  lvim.builtin.which_key.mappings['ty'] = {"<cmd>TranslateX<CR>", "Translate Yank"}

  -- 保存全部
  lvim.builtin.which_key.mappings['s'] = {"<cmd>wa!<CR>", "Save All"}

  -- 窗口管理
  lvim.builtin.which_key.mappings['w'] = {
    name = "Window",
    v = { ":vsp<cr>", "Split Vertical" },
    h = { ":sp<cr>", "Split Horizontal" },
    c = { "<c-w>c", "Close current" },
    o = { "<c-w>o", "Close Other" },
    ['='] = { "<c-w>=", "Change Average" }
  }

  -- 搜索
  lvim.builtin.which_key.mappings["f"] = {
    name = "Telescope",
    -- f = { "<cmd>telescope find_files<cr>", "find_files" },
    -- lunarvim 的配置，在 git repo 中使用 git_files，否则使用 fine_files
    f = lvim.builtin.which_key.mappings["f"],
    l = { "<cmd>telescope live_grep<cr>", "live_grep" },
    b = { "<cmd>telescope buffers<cr>", "buffers" },
    m = { "<cmd>telescope marks<cr>", "marks" },
    g = { "<cmd>telescope git_status<cr>", "git_status" },
    o = { "<cmd>telescope oldfiles<cr>", "oldfiles" },
    q = { "<cmd>telescope quickfix<cr>", "quickfix" },
    c = { "<cmd>telescope commands<cr>", "commands" },
    k = { "<cmd>telescope keymaps<cr>", "keymaps" },
    p = { "<cmd>telescope projects<cr>", "projects" },
    t = {
      "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
      "colorscheme with preview",
    },
    s = { "<cmd>telescope<cr>", "telescope" },
  }

  -- 回车补全
  local cmp = require"cmp"
  lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  })

  -- nvim tree
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
    { key = "f", action = "telescope_find_files", action_cb = telescope_find_files },
    { key = "g", action = "telescope_live_grep", action_cb = telescope_live_grep },
  }
end

return M
