-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint

return {
  on_setup = function(server, capabilities)
		-- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
    server:setup {
      capabilities = capabilities,
      settings = {
        codeAction = {
          disableRuleComment = {
            enable = true,
            location = "separateLine"
          },
          showDocumentation = {
            enable = true
          }
        },
        codeActionOnSave = {
          enable = false,
          mode = "all"
        },
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "yarn",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {
          mode = "auto"
        }
      }
    }
  end,
}
