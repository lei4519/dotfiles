local M = {}

local function node(dap)
  -- https://code.visualstudio.com/docs/editor/variables-reference
  -- ${workspaceFolder} - 在 VS Code 中打开的文件夹的路径
  -- ${workspaceFolderBasename} - 在 VS Code 中打开的文件夹的名称，不带任何斜线 (/)
  -- ${file} - 当前打开的文件
  -- ${fileWorkspaceFolder} - 当前打开文件的工作区文件夹
  -- ${relativeFile} - 当前打开的文件相对于workspaceFolder
  -- ${relativeFileDirname} - 当前打开文件的相对目录名workspaceFolder
  -- ${fileBasename} - 当前打开文件的基本名称
  -- ${fileBasenameNoExtension} - 当前打开的文件的基本名称，没有文件扩展名
  -- ${fileDirname} - 当前打开文件的目录名
  -- ${fileExtname} - 当前打开文件的扩展名
  -- ${cwd} - 启动 VS Code 时任务运行器的当前工作目录
  -- ${lineNumber} - 活动文件中当前选定的行号
  -- ${selectedText} - 活动文件中当前选定的文本
  -- ${execPath} - 正在运行的 VS Code 可执行文件的路径
  -- ${defaultBuildTask} - 默认构建任务的名称
  -- ${pathSeparator} - 操作系统用来分隔文件路径中的组件的字符


  -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript
  dap.adapters.node2 = {
    type = 'executable',
    name = "node2",
    command = 'node',
    args = { HOME .. "/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js" }
  }
  dap.configurations.javascript = {
    {
      name = 'Launch',
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    }
  }
end

local function rust(_)
  -- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(via--codelldb)
  -- 在 rust-tools 的setup 中配置了
end

function M.config()
  -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
  lvim.builtin.dap.on_config_done = function(dap)
    node(dap)
    rust(dap)
    --     "theHamsta/nvim-dap-virtual-text",
    --     "rcarriga/nvim-dap-ui"

    -- require("plugins.dap.node")
    -- local dapui = require("dapui")

    -- require("nvim-dap-virtual-text").setup({
    --   commented = true
    -- })

    -- dapui.setup({
    --   icons = {
    --     expanded = "▾",
    --     collapsed = "▸"
    --   },
    --   mappings = {
    --     -- Use a table to apply multiple mappings
    --     expand = { "o", "<CR>", "<2-LeftMouse>" },
    --     open = "o",
    --     remove = "d",
    --     edit = "e",
    --     repl = "r",
    --     toggle = "t"
    --   },
    --   sidebar = {
    --     -- You can change the order of elements in the sidebar
    --     elements = { -- Provide as ID strings or tables with "id" and "size" keys
    --       {
    --         id = "scopes",
    --         size = 0.25 -- Can be float or integer > 1
    --       }, {
    --         id = "breakpoints",
    --         size = 0.25
    --       }, {
    --         id = "stacks",
    --         size = 0.25
    --       }, {
    --         id = "watches",
    --         size = 00.25
    --       } },
    --     size = 40,
    --     position = "left" -- Can be "left", "right", "top", "bottom"
    --   },
    --   tray = {
    --     elements = { "repl" },
    --     size = 10,
    --     position = "bottom" -- Can be "left", "right", "top", "bottom"
    --   },
    --   floating = {
    --     max_height = nil, -- These can be integers or a float between 0 and 1.
    --     max_width = nil, -- Floats will be treated as percentage of your screen.
    --     border = "single", -- Border style. Can be "single", "double" or "rounded"
    --     mappings = {
    --       close = { "q", "<Esc>" }
    --     }
    --   },
    --   windows = {
    --     indent = 1
    --   },
    --   render = {
    --     max_type_length = nil -- Can be integer or nil.
    --   }
    -- }) -- use default

    -- dap.listeners.after.event_initialized["dapui_config"] = function()
    --   dapui.open()
    -- end
    -- dap.listeners.before.event_terminated["dapui_config"] = function()
    --   dapui.close()
    -- end
    -- dap.listeners.before.event_exited["dapui_config"] = function()
    --   dapui.close()
    -- end
  end
end

return M
