local nvm = os.getenv("NVM_BIN");
if nvm ~= nil then
  vim.g.coc_node_path = nvm .. "/node";
end

vim.g.coc_global_extensions = {
  'coc-marketplace',
  'coc-diagnostic',
  'coc-explorer',

  'coc-translator',

  'coc-html',
  'coc-tsserver',
  'coc-svelte',
  'coc-css',
  'coc-cssmodules',
  'coc-json',
  'coc-rust-analyzer',
  'coc-sumneko-lua',
  'coc-tailwindcss',
  'coc-sh',

  'coc-toml',

  'coc-eslint',
  'coc-markdownlint',
  'coc-prettier',
  'coc-stylelintplus',

  'coc-emmet',

  'coc-project',
  'coc-yank', -- 复制高亮
  'coc-symbol-line',
  'coc-highlight', -- 颜色高亮
  'coc-pairs', -- 自动配对， { [ `
  'coc-git',
  'coc-lists',
  'coc-snippets',
  'coc-spell-checker',
  -- 'coc-lightbulb', -- code action 小灯泡提示
}

vim.schedule(function()
  vim.cmd('au! CocFzfLocation User CocLocationsChange')
end)
vim.g.coc_enable_locationlist = 0
vim.cmd([[
    aug Coc
        au!
        au User CocLocationsChange lua L.jumpToLoc()
    aug END
]])

-- just use `L` prefix as a global function for a demo
-- please use module instead in reality
function L.jumpToLoc(locs)
  locs = locs or vim.g.coc_jump_locations
  vim.fn.setloclist(0, {}, ' ', { title = 'CocLocationList', items = locs })
  local winid = vim.fn.getloclist(0, { winid = 0 }).winid
  if winid == 0 then
    vim.cmd('bo lw')
  else
    vim.api.nvim_set_current_win(winid)
  end
end

function L.diagnostic()
  vim.fn.CocAction('diagnosticList', '', function(err, res)
    if err == vim.NIL then
      local items = {}
      for _, d in ipairs(res) do
        local text = ('[%s%s] %s'):format((d.source == '' and 'coc.nvim' or d.source),
          (d.code == vim.NIL and '' or ' ' .. d.code), d.message:match('([^\n]+)\n*'))
        local item = {
          filename = d.file,
          lnum = d.lnum,
          end_lnum = d.end_lnum,
          col = d.col,
          end_col = d.end_col,
          text = text,
          type = d.severity
        }
        table.insert(items, item)
      end
      vim.fn.setqflist({}, ' ', { title = 'CocDiagnosticList', items = items })
      vim.cmd('bo cope')
    end
  end)
end

