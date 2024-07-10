return {
  -- {
  --   "3rd/image.nvim",
  --   config = function() end,
  -- },
  -- {
  --   "HakonHarnes/img-clip.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     -- add options here
  --     -- or leave it empty to use the default settings
  --   },
  --   -- keys = {
  --   --   -- suggested keymap
  --   --   { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  --   -- },
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "/Users/lay/Library/CloudStorage/OneDrive-Personal/App/notes",
        },
      },

      -- see below for full list of options 👇
    },
  },
}
