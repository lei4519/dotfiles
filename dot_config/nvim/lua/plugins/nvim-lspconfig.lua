return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
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
}
