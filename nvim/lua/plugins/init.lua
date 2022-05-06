-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", -- "https://github.com/wbthomason/packer.nvim",
    "https://gitcode.net/mirrors/wbthomason/packer.nvim", install_path})

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
        -- Packer 可以升级自己
        use("wbthomason/packer.nvim")

        -- 注册当前目录下的插件
        for item in require("io").popen("ls " .. NVIMRC .. "/lua/plugins"):lines() do
            -- 文件以 -- 开头表示注释，不加载插件
            if item.sub(item, 1, 2) ~= '--' and item ~= 'init.lua' then
                -- 文件
                if item.sub(item, -4) == '.lua' then
                    -- print("plugins." .. item.sub(item, 0, -5))
                    require("plugins." .. item.sub(item, 0, -5)).setup(use)
                else
                    -- 目录，调用 /init.lua
                    require("plugins." .. item).setup(use)
                end
            end
        end

        if packer_bootstrap then
            packer.sync()
        end
    end,
    config = {
        -- 最大并发数
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
        },
        display = {
            -- 使用浮动窗口显示
            open_fn = function()
                return require("packer.util").float({
                    border = "single"
                })
            end
        }
    }
})
