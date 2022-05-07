local lsp_installer = require("nvim-lsp-installer")

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("plugins.lsp.config.lua"), -- lua/lsp/config/lua.lua
  bashls = require("plugins.lsp.config.bash"),
  html = require("plugins.lsp.config.html"),
  cssls = require("plugins.lsp.config.css"),
  emmet_ls = require("plugins.lsp.config.emmet"),
  jsonls = require("plugins.lsp.config.json"),
  tsserver = require("plugins.lsp.config.ts"),
  -- eslint = require("plugins.lsp.config.eslint"),
  rust_analyzer = require("plugins.lsp.config.rust"),
}

-- 自动安装 Language Servers
for name, config in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    else
      if type(config) == "table" and config.on_init then
        config.on_init(server)
        print("onInit " .. type(config))
      end
    end
  end
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
  local config = servers[server.name]
  if config == nil then
    return
  end
  if type(config) == "table" and config.on_setup then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(server, capabilities)
  else
    -- 使用默认参数
    server:setup({})
  end
end)
