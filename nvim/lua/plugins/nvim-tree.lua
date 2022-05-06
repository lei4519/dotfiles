local M = {}

local function config()
    -- local nvim_tree = require'nvim-tree'
    local status, nvim_tree = pcall(require, "nvim-tree")
    if not status then
        vim.notify("没有找到 nvim-tree")
        return
    end

    -- 列表操作快捷键
    local list_keys = require("keybindings").nvimTreeList

    nvim_tree.setup({
        git = {
            enable = true
        },
        -- update_cwd = true,
        -- update_focused_file = {
        --     enable = true,
        --     -- update_cwd = true
        -- },
        -- 隐藏 .文件 和 node_modules 文件夹
        filters = {
            dotfiles = false
            -- custom = { "node_modules", "target" },
        },
        view = {
            -- 宽度
            width = 36,
            -- 也可以 'right'
            side = "left",
            -- 隐藏根目录
            hide_root_folder = false,
            -- 自定义列表中快捷键
            mappings = {
                custom_only = true,
                list = list_keys
            },
            -- 不显示行数
            number = false,
            relativenumber = false,
            -- 显示图标
            signcolumn = "yes"
        },
        actions = {
            open_file = {
                -- 首次打开大小适配
                resize_window = true,
                -- 打开文件时关闭 tree
                quit_on_open = false
            }
        }
    })
end

function M.setup(use)
    -- nvim-tree
    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = config
    }
end

return M
