local M = {}

local function config()
    vim.o.background = "dark"
    vim.g.tokyonight_style = "storm" -- day / night
    -- 半透明
    vim.g.tokyonight_transparent = true
    vim.g.tokyonight_transparent_sidebar = true
    local colorscheme = "tokyonight"
    -- tokyonight
    -- dracula
    -- OceanicNext
    -- gruvbox
    -- zephyr
    -- nord
    -- onedark
    -- nightfox
    -- " Plug 'yonlu/omni.vim' " https://github.com/yonlu/omni.vim
    -- " Plug 'catppuccin/nvim', {'as': 'catppuccin'} " https://github.com/catppuccin/nvim
    -- " Plug 'olimorris/onedarkpro.nvim' " https://github.com/olimorris/onedarkpro.nvim
    -- " Plug 'luisiacc/gruvbox-baby', {'branch': 'main'} " https://github.com/luisiacc/gruvbox-baby
    local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
    if not status_ok then
        vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
        return
    end
end

function M.setup(use)
    -- tokyonight
    use {"folke/tokyonight.nvim", config = config}
    -- -- OceanicNext
    -- use("mhartington/oceanic-next")
    -- -- dracula
    -- use("dracula/vim")
    -- -- gruvbox
    -- use({
    --     "ellisonleao/gruvbox.nvim",
    --     requires = {"rktjmp/lush.nvim"}
    -- })
    -- -- zephyr
    -- -- use("glepnir/zephyr-nvim")
    -- -- nord
    -- use("shaunsingh/nord.nvim")
    -- -- onedark
    -- use("ful1e5/onedark.nvim")
    -- -- nightfox
    -- use("EdenEast/nightfox.nvim")

end

return M
