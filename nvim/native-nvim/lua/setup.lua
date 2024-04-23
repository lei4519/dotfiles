-- nvim的配置目录 全局变量
HOME = vim.env.HOME
NVIMRC = HOME .. "/dotfiles/lvim"
DAP_INSTALL = HOME .. "/.local/share/nvim/dapinstall/"

L = {}

function L.CocOutLineToggle()
  if L.CocOutLineOpen then
    L.CocOutLineOpen = false
    vim.cmd("call CocAction('hideOutline')")
  else
    L.CocOutLineOpen = true
    vim.cmd("call CocAction('showOutline')")
  end
end

-- 基础配置
require("basic")
-- 快捷键映射
-- require("keybindings")
-- 插件管理
require("plugins")
-- 自动命令
require("autocmds")

require('coc-config')
-- require("dap-conf")


-- vim.g.vimspector_install_gadgets = { 'vscode-node-debug2', 'CodeLLDB' };
-- vim.g.vimspector_configurations = {
--   node_run = {
--     adapter = "vscode-node",
--     filetypes = { "javascript", "typescript" },
--     configuration = {
--       request = "launch",
--       protocol = "auto",
--       stopOnEntry = true,
--       console = "integratedTerminal",
--       program = "${file}",
--       cwd = "${file}"
--     }
--   },
--   rust_run = {
--     adapter = "CodeLLDB",
--     filetypes = { "rust" },
--     configuration = {
--       request = "launch",
--       program = "${file}",
--       cwd = "${file}"
--     }
--   }
-- }
