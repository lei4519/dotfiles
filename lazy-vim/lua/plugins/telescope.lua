local util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = {
    { "<leader><space>", util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
  },
  -- opts = {
  --   defaults = {
  --     prompt_prefix = " ",
  --     selection_caret = " ",
  --     mappings = {
  --       i = {
  --         ["<c-t>"] = function(...)
  --           return require("trouble.providers.telescope").open_with_trouble(...)
  --         end,
  --         ["<a-t>"] = function(...)
  --           return require("trouble.providers.telescope").open_selected_with_trouble(...)
  --         end,
  --         ["<C-j>"] = function(...)
  --           return require("telescope.actions").cycle_history_next(...)
  --         end,
  --         ["<C-k>"] = function(...)
  --           return require("telescope.actions").cycle_history_prev(...)
  --         end,
  --         ["<C-d>"] = function(...)
  --           return require("telescope.actions").preview_scrolling_down(...)
  --         end,
  --         ["<C-u>"] = function(...)
  --           return require("telescope.actions").preview_scrolling_up(...)
  --         end,
  --       },
  --     },
  --   },
  -- },
}
