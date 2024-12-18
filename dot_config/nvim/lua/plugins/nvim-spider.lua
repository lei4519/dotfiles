return {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "E",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      -- {
      --   "w",
      --   "<cmd>lua require('spider').motion('w')<CR>",
      --   mode = { "n", "o", "x" },
      -- },
      {
        "B",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
    },
  }
