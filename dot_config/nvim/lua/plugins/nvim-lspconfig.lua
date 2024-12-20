return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        settings = {
          codeActionOnSave = {
            enable = true,
            mode = "all",
          },
          format = false,
          run = "onType", -- onType or onSave
          -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
          workingDirectories = {
            mode = "auto", -- "auto" or "location"
          },
        },
      },
      gopls = {
        settings = {
          gopls = {
            codelenses = {
              gc_details = true,
            },
          },
        },
      },
      vtsls = {
        settings = {
          vtsls = {
            autoUseWorkspaceTsdk = false,
          },
          typescript = {
            inlayHints = false,
            -- {
            --   enumMemberValues = { enabled = true },
            --   functionLikeReturnTypes = { enabled = true },
            --   parameterNames = { enabled = "literals" },
            --   parameterTypes = { enabled = true },
            --   propertyDeclarationTypes = { enabled = true },
            --   variableTypes = { enabled = false },
            -- },
          },
        },
      },
    },
  },
  -- setup = {
  --   eslint = function()
  --     -- local function get_client(buf)
  --     --   return LazyVim.lsp.get_clients({ name = "eslint", bufnr = buf })[1]
  --     -- end
  --     --
  --     -- local formatter = LazyVim.lsp.formatter({
  --     --   name = "eslint: lsp",
  --     --   primary = false,
  --     --   priority = 200,
  --     --   filter = "eslint",
  --     -- })
  --     --
  --     -- -- Use EslintFixAll on Neovim < 0.10.0
  --     -- if not pcall(require, "vim.lsp._dynamic") then
  --     --   formatter.name = "eslint: EslintFixAll"
  --     --   formatter.sources = function(buf)
  --     --     local client = get_client(buf)
  --     --     return client and { "eslint" } or {}
  --     --   end
  --     --   formatter.format = function(buf)
  --     --     local client = get_client(buf)
  --     --     if client then
  --     --       local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
  --     --       if #diag > 0 then
  --     --         vim.cmd("EslintFixAll")
  --     --       end
  --     --     end
  --     --   end
  --     -- end
  --
  --     -- register the formatter with LazyVim
  --     -- LazyVim.format.register(formatter)
  --   end,
  -- },
}
