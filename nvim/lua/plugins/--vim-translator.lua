local M = {}

function M.setup(use)
    use('voldikss/vim-translator')
    -- vim.g.translator_history_enable = true
    vim.g.translator_window_max_width = 1
    vim.g.translator_window_max_height = 1
end

return M

