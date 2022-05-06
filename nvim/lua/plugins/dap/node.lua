-- git clone https://github.com/microsoft/vscode-node-debug2.git ~/.config/nvim/lua/dap/nvim-dap/adapters/vscode-node-debug2
-- cd vscode-node-debug2
-- npm install
-- npm run build

local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
	name = "node2",
  command = 'node',
	args = { NVIMRC .. "/lua/dap/nvim-dap/adapters/vscode-node-debug2/out/src/nodeDebug.js" }
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  }
}
