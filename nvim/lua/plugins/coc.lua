local M = {}

local function config()
    local nvm = os.getenv("NVM_BIN");
    if nvm ~= nil then
        vim.g.coc_node_path = nvm .. "/node";
    end

    vim.g.coc_global_extensions = {
      'coc-marketplace',
      'coc-translator',
      'coc-tsserver',
      'coc-eslint',
      'coc-prettier',
      'coc-css',
      'coc-json',
      'coc-html',
      'coc-rust-analyzer',
      'coc-yank', -- 复制高亮
      'coc-emmet',
      'coc-highlight', -- 颜色高亮
      'coc-pairs', -- 自动配对， { [ `
      'coc-lists',
      'coc-git',
    }
end

M.setup = function(use)
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = config
    }
end

return M
