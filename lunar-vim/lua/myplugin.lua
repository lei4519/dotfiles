local M = {}

local fetch_comment_start = '/** fetchTsComment'

function M.codeaction()
  local null_ls = require("null-ls")

  local fetch_ts_type = {
    name = "FetchTsType",
    method = null_ls.methods.CODE_ACTION,
    filetypes = { "typescript", "typescriptreact" },
    generator = {
      fn = function(context)
        if fetch_comment_start == context.content[context.row] then
          return {
            {
              title = "Generator Type",
              action = function()
                local file_end_row = vim.api.nvim_buf_line_count(context.bufnr)
                local comment_end = context.row + 1
                local config = {}
                for i = comment_end, file_end_row, 1 do
                  local line = context.content[i]
                  if string.find(line, '*/') then

                    comment_end = i
                    break
                  end
                  line = string.gsub(line, '%s-*%s-@', '@')

                  local key, value = string.match(line, "@(.-)%s(.*)")

                  config[key] = value
                end

                if config.namespace == nil then
                  vim.notify('missing namespace field')
                  return
                end

                if config.url == nil then
                  vim.notify('missing url field')
                  return
                end

                local insertIdx = comment_end + 1

                for item in require("io").popen("node $(echo $HOME)/dotfiles/lvim/lua/--fetchType.js"):lines() do
                  vim.api.nvim_buf_set_lines(context.bufnr, insertIdx, insertIdx, false, { item })
                  insertIdx = insertIdx + 1
                end
              end
            }
          }
        end
      end
    }
  }
  null_ls.register(fetch_ts_type)
end

function M.setup()
  M.codeaction()
end

return M
