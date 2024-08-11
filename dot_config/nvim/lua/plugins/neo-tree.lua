local function getTelescopeOpts(state, path)
  return {
    cwd = path,
    search_dirs = { path },
    attach_mappings = function(prompt_bufnr, map)
      local actions = require("telescope.actions")
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local action_state = require("telescope.actions.state")
        local selection = action_state.get_selected_entry()
        local filename = selection.filename
        if filename == nil then
          filename = selection[1]
        end
        -- any way to open the file without triggering auto-close event of neo-tree?
        require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
      end)
      return true
    end,
  }
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        -- ["/"] = "none",
        -- ["t"] = "none",
        -- ["R"] = "search_by_grugfar",
        ["f"] = "filter_on_submit",
        ["tf"] = "fzf_find",
        ["tg"] = "fzf_grep",
        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" then
            if not node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            elseif node:has_children() then
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
        end,
      },
    },
    commands = {
      search_by_spectre = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("spectre").open({
          is_insert_mode = true,
          cwd = path,
        })
      end,
      search_by_grugfar = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("grug-far").grug_far({
          prefills = {
            filesFilter = path,
          },
        })
      end,
      telescope_find = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("telescope.builtin").find_files(getTelescopeOpts(state, path))
      end,
      telescope_grep = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("telescope.builtin").live_grep(getTelescopeOpts(state, path))
      end,
      fzf_find = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("fzf-lua").files({ cwd = path })
      end,
      fzf_grep = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("grug-far").grug_far({ prefills = { flags = path } })
        -- require("fzf-lua").live_grep({ cwd = path })
      end,
    },
    filesystem = {
      never_show = {
        ".DS_Store",
        "thumbs.db",
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      -- follow_current_file = {
      --   enabled = true,
      -- },
      group_empty_dirs = true,
      -- window = {
      --   fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
      --     ["<C-j>"] = "move_cursor_down",
      --     ["<C-k>"] = "move_cursor_up",
      --   },
      -- },
    },
  },
  keys = {
    { "<leader>e", "<cmd>Oil --float<CR>", desc = "Explorer (Root Dir)", remap = true },
    -- { "<leader>E", "<leader>fM", desc = "Explorer (cwd)", remap = true },
  },
}
