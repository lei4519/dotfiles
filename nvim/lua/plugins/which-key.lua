-- https://github.com/folke/which-key.nvim
local M = {}

local function config()
    require("which-key").setup()
end

function M.setup(use)
    -- which-key
    use {"folke/which-key.nvim", config = config}
end

return M
