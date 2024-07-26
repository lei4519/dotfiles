return {
  "echasnovski/mini.files",
  opts = {
    --   windows = {
    --     -- Maximum number of windows to show side by side
    --     max_number = math.huge,
    --     -- Whether to show preview of file/directory under cursor
    --     preview = true,
    --     -- Width of focused window
    --     width_focus = 30,
    --     -- Width of non-focused window
    --     width_nofocus = 20,
    --     -- Width of preview window
    --     width_preview = 50,
    --   },
    --   options = {
    --     -- Whether to use for editing directories
    --     -- Disabled by default in LazyVim because neo-tree is used for that
    --     use_as_default_explorer = true,
    --   },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini.files (directory of current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(vim.loop.cwd(), true)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
}
