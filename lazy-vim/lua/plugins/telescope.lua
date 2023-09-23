return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<C-j>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-k>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-d>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-u>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
      },
    },
  },
}
