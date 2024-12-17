return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = not vim.g.ai_cmp,
        auto_trigger = true,
        keymap = {
          accept = false, -- handled by nvim-cmp / blink.cmp
          next = "<M-]>",
          prev = "<M-[>",
          -- accept = "<M-l>",
          -- accept_word = false,
          -- accept_line = false,
          -- next = "<M-]>",
          -- prev = "<M-[>",
          -- dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        rust = true,
        go = false,
        -- html = true,
        lua = true,
        javascript = true,
        javascriptreact = true,
        typescript = true,
        typescriptreact = true,
        ["*"] = false,
      },
    },
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       copilot_node_command = vim.fn.expand("$FNM_DIR") .. "/node-versions/v18.19.0/installation/bin/node",
  --     })
  --   end,
  -- },
}
