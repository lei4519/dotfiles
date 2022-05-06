local M = {}

local function config()
end

function M.setup(use)
    -- project
    -- https://github.com/ahmedkhalf/project.nvim
    use {"kevinhwang91/rnvimr", config = config}
end

return M
