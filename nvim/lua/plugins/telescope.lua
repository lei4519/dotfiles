
local M = {}

local function config()
    -- load extensions
    local extensions = {"ui-select", "live_grep_raw"}

    pcall(function()
        for _, ext in ipairs(extensions) do
            telescope.load_extension(ext)
        end
    end)

    local status, telescope = pcall(require, "telescope")
    if not status then
        vim.notify("没有找到 telescope")
        return
    end

    -- local actions = require("telescope.actions")
    telescope.setup({
        defaults = {
            -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
            initial_mode = "insert",
            -- vertical , center , cursor
            layout_strategy = "horizontal",
            -- 窗口内快捷键
            mappings ={
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
              },
            } 
        },
        pickers = {
            find_files = {
                theme = "dropdown" -- 可选参数： dropdown, cursor, ivy
            }
        },
        extensions = {
            ["ui-select"] = {require("telescope.themes").get_dropdown({
                -- even more opts
            })}
        }
    })
end

function M.setup(use)
    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim", -- UI 选择器，例如 code action 的多个选项
                    "nvim-telescope/telescope-live-grep-raw.nvim" -- 可以携带参数的grep，例如忽略大小写等
        },
        config = config
    }

    local opt = {
      noremap = true,
      silent = true,
     }

    -- 本地变量
    local map = vim.api.nvim_set_keymap

    map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
    map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
    map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
    map("n", "<leader>fm", ":Telescope marks<CR>", opt)
    map("n", "<leader>fs", ":Telescope git_status<CR>", opt)
    map("n", "<leader>fo", ":Telescope oldfiles<CR>", opt)
    map("n", "<leader>fq", ":Telescope quickfix<CR>", opt)
    map("n", "<leader>fc", ":Telescope commands<CR>", opt)
    map("n", "<leader>fp", ":Telescope<CR>", opt)
  
end

return M
