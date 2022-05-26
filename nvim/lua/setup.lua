-- nvim的配置目录 全局变量
HOME = vim.env.HOME
NVIMRC = HOME .. "/dotfiles/lvim"
DAP_INSTALL = HOME .. "/.local/share/nvim/dapinstall/"

L = {}

-- 基础配置
require("basic")
-- 快捷键映射
-- require("keybindings")
-- 插件管理
require("plugins")
-- 自动命令
require("autocmds")
