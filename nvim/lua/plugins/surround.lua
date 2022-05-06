local M = {}

local function config()
    local status, surround = pcall(require, "surround")
    if not status then
        vim.notify("没有找到 surround")
        return
    end

    surround.setup({
        mappings_style = "surround"
    })
end

function M.setup(use)
    -- surround
    use {"ur4ltz/surround.nvim", config = config}
end

return M
