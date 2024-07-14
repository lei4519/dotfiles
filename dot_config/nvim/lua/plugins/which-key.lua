return {
  "folke/which-key.nvim",
  opts = {
    -- --- @type false | "classic" | "modern" | "helix"
    -- preset = "helix",
    -- plugins = { spelling = true },
    spec = {
      mode = { "n", "v" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left Buffer" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffer" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right Buffer" },
      {
        "gA",
        "<cmd>lua vim.lsp.buf.code_action({ context={ only = { 'source' }, diagnostics = {} } })<cr>",
        desc = "Source Action",
      },
      { "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "gk", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line Diagnostics" },
      {
        "<leader>w",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
}
