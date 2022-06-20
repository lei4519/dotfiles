local M = {}

function M.config()
  local u = require "lspconfig/util"
  lvim.lsp.null_ls.setup.root_dir = u.root_pattern(".null-ls-root", "Makefile", "package.json", "tsconfig.json", "jsconfig.json", ".git")

  local formatters = require "lvim.lsp.null-ls.formatters"
  formatters.setup {
    {
      name = "prettier",
      -- "typescriptreact" ,"typescript" , "javascript" , "javascriptreact" use eslint
      filetypes = {
        "scss", "css", "json", "handlebars", "yaml", "graphql", "html", "markdown", "jsonc", "vue", "less"
      }
    },
    {
      name = "rustfmt",
      -- extra_args
      args = function(params)
        local Path = require("plenary.path")
        local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

        if cargo_toml:exists() and cargo_toml:is_file() then
          for _, line in ipairs(cargo_toml:readlines()) do
            local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
            if edition then
              return { "--edition=" .. edition }
            end
          end
        end
        -- default edition when we don't find `Cargo.toml` or the `edition` in it.
        return { "--edition=2021" }
      end
    },
  }

  local linters = require "lvim.lsp.null-ls.linters"
  linters.setup {
    -- { name = "eslint", prefer_local = "node_modules/.bin" },
  }

  local code_actions = require "lvim.lsp.null-ls.code_actions"
  code_actions.setup {
    -- { name = "gitsigns" },
    -- { name = "eslint", prefer_local = "node_modules/.bin" },
  }
end

return M
