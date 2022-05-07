return {
  on_setup = function(server, capabilities)
    server:setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, _)
        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end,
    })
  end,
}
