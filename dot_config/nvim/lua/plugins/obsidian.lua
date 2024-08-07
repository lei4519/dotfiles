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
    enabled = false,
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
    keys = {
      { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "Search" },
      { "<leader>nr", "<cmd>ObsidianRename<cr>", desc = "Rename" },
      { "<leader>nl", "<cmd>ObsidianLinks<cr>", desc = "Links" },
      { "<leader>nL", "<cmd>ObsidianLink<cr>", desc = "Link" },
      { "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
      { "<leader>nt", "<cmd>ObsidianTags<cr>", desc = "Tags" },
      { "<leader>nT", "<cmd>ObsidianTemplate<cr>", desc = "Template" },
      { "<leader>np", "<cmd>ObsidianPasteImg<cr>", desc = "PasteImg" },
      { "<leader>no", "<cmd>ObsidianQuickSwitch<cr>", desc = "QuickSwitch" },
      { "<leader>nO", "<cmd>ObsidianOpen<cr>", desc = "Open" },
      { "<leader>nn", "<cmd>ObsidianNew<cr>", desc = "New" },
    },
    opts = {
      -- A list of workspace names, paths, and configuration overrides.
      -- If you use the Obsidian app, the 'path' of a workspace should generally be
      -- your vault root (where the `.obsidian` folder is located).
      -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
      -- the workspace to the first workspace in the list whose `path` is a parent of the
      -- current markdown file being edited.
      workspaces = {
        {
          name = "notes",
          path = "~/notes",
        },
      },

      -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
      -- way then set 'mappings = {}'.
      -- mappings = {
      --   -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      --   ["gf"] = {
      --     action = function()
      --       return require("obsidian").util.gf_passthrough()
      --     end,
      --     opts = { noremap = false, expr = true, buffer = true },
      --   },
      --   -- Toggle check-boxes.
      --   ["<leader>ch"] = {
      --     action = function()
      --       return require("obsidian").util.toggle_checkbox()
      --     end,
      --     opts = { buffer = true },
      --   },
      --   -- Smart action depending on context, either follow link or toggle checkbox.
      --   ["<cr>"] = {
      --     action = function()
      --       return require("obsidian").util.smart_action()
      --     end,
      --     opts = { buffer = true, expr = true },
      --   },
      -- },

      -- Where to put new notes. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      notes_subdir = "fragment",
      new_notes_location = "notes_subdir",

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          -- suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
          suffix = title
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.date("%Y%m%d%H%M")) .. "-" .. suffix
      end,

      ui = {
        enable = false,
      },
      -- Optional, for templates (see below).
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },

      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = "fzf-lua",
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        mappings = {
          -- Create a new note from your query.
          new = "<C-x>",
          -- Insert a link to the selected note.
          insert_link = "<C-l>",
        },
      },

      -- Set the maximum number of lines to read from notes on disk when performing certain searches.
      -- search_max_lines = 1000,

      -- Optional, configure additional syntax highlighting / extmarks.
      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.

      -- Specify how to handle attachments.
      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = "attachments", -- This is the default
        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        -- img_text_func = function(client, path)
        --   path = client:vault_relative_path(path) or path
        --   return string.format("![%s](%s)", path.name, path)
        -- end,
      },
    },
  },
}
