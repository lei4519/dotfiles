return {
  {
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
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6", --recommended as each new version will have breaking changes
    opts = {},
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "tzachar/highlight-undo.nvim",
    config = true,
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    config = true,
  },
  -- {
  --   "shortcuts/no-neck-pain.nvim",
  --   version = "*",
  --   keys = { { "<leader>uz", "<cmd>NoNeckPain<cr>", desc = "Toggle NoNeckPain" } },
  -- },
  {
    -- enabled = false,
    "folke/zen-mode.nvim",
    keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
    opts = {
      -- on_open = function()
      --   vim.cmd("TWEnable")
      -- end,
      -- on_close = function()
      --   vim.cmd("TWDisable")
      -- end,
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      options = {
        enabled = true,
      },
      -- plugins = {
      --   kitty = {
      --     enabled = true,
      --   },
      -- },
    },
  },
  {
    -- 窗口边框颜色
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
  },
  {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_c, 2, { require("NeoComposer.ui").status_recording })
    end,
  },
  { "kevinhwang91/nvim-bqf", ft = "qf", dependencies = { "junegunn/fzf" } },
  {
    "potamides/pantran.nvim",
    opts = {
      default_engine = "google",
    },
    keys = { { "<leader>tn", "<cmd>Pantran<CR>", desc = "Translate" } },
  },
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = ";", -- Recommended to be a single key
      buffer_leader_key = "m", -- Per Buffer Mappings
    },
  },
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")

      mc.setup()

      -- Add cursors above/below the main cursor.
      vim.keymap.set({ "n", "v" }, "<up>", function()
        mc.addCursor("k")
      end)
      vim.keymap.set({ "n", "v" }, "<down>", function()
        mc.addCursor("j")
      end)

      -- Add a cursor and jump to the next word under cursor.
      vim.keymap.set({ "n", "v" }, "<c-.>", function()
        mc.addCursor("*")
      end)

      -- Jump to the next word under cursor but do not add a cursor.
      vim.keymap.set({ "n", "v" }, "<c-,>", function()
        mc.skipCursor("*")
      end)

      -- Rotate the main cursor.
      vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
      vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

      -- Delete the main cursor.
      vim.keymap.set({ "n", "v" }, "<leader>x", mc.deleteCursor)

      -- Add and remove cursors with control + left click.
      vim.keymap.set("n", "<c-leftmouse>", mc.handleMouse)

      vim.keymap.set({ "n", "v" }, "<c-q>", function()
        if mc.cursorsEnabled() then
          -- Stop other cursors from moving.
          -- This allows you to reposition the main cursor.
          mc.disableCursors()
        else
          mc.addCursor()
        end
      end)

      vim.keymap.set("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
        end
      end)

      -- Align cursor columns.
      vim.keymap.set("n", "<leader>a", mc.alignCursors)

      -- Split visual selections by regex.
      vim.keymap.set("v", "S", mc.splitCursors)

      -- Append/insert for each line of visual selections.
      vim.keymap.set("v", "I", mc.insertVisual)
      vim.keymap.set("v", "A", mc.appendVisual)

      -- match new cursors within visual selections by regex.
      vim.keymap.set("v", "M", mc.matchCursors)

      -- Rotate visual selection contents.
      -- vim.keymap.set("v", "<leader>t", function()
      --   mc.transposeCursors(1)
      -- end)
      -- vim.keymap.set("v", "<leader>T", function()
      --   mc.transposeCursors(-1)
      -- end)

      -- Customize how cursors look.
      vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
      vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
      vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    end,
  },
}
